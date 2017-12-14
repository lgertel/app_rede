class Admin::TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin_ticket, only: [:show, :edit, :update, :destroy]

  # GET /admin/tickets
  # GET /admin/tickets.json
  def index
    authorize! :read, Admin::Ticket

    @admin_tickets = Admin::Ticket.accessible_by(current_ability, :read)
  end

  # GET /admin/tickets/1
  # GET /admin/tickets/1.json
  def show

  end

  # GET /admin/tickets/new
  def new
    authorize! :create, Admin::Ticket

    @admin_ticket = Admin::Ticket.new
  end

  # GET /admin/tickets/1/edit
  def edit
    authorize! :edit, Admin::Ticket
  end

  # POST /admin/tickets
  # POST /admin/tickets.json
  def create
    authorize! :create, Admin::Ticket

    @admin_ticket = Admin::Ticket.new(admin_ticket_params)
    role = current_user.roles.first
    flow = Admin::Flow.create(flow_type: admin_ticket_params["ticket_type"], stage: 1, role_id: role.id)
    @admin_ticket.flow = flow

    respond_to do |format|
      if @admin_ticket.save
        format.html { redirect_to @admin_ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @admin_ticket }
      else
        format.html { render :new }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tickets/1
  # PATCH/PUT /admin/tickets/1.json
  def update
    authorize! :update, Admin::Ticket

    params = admin_ticket_params
    plus_step = true
    jump_steps = 0

    eps_role = current_user.has_role? :eps
    if @admin_ticket.flow.stage == 1 && eps_role
      audio = admin_ticket_params[:audio]
      upload_file(audio)
      admin_ticket_params[:audio] = audio.original_filename
      params[:audio] = admin_ticket_params[:audio].original_filename
    end

    backoffice_role = current_user.has_role? :backoffice
    if @admin_ticket.flow.stage == 2 && backoffice_role
      dossier = admin_ticket_params[:dossier]
      upload_file(dossier)
      admin_ticket_params[:dossier] = dossier.original_filename
      params[:dossier] = admin_ticket_params[:dossier].original_filename
    end

    n2_role = current_user.has_role? :n2
    if @admin_ticket.flow.stage == 3 && n2_role
      if params[:dossier_status] == "0"
        plus_step = false
        jump_steps = 1
      end
    end

    if @admin_ticket.flow.stage == 6 && n2_role
      report = admin_ticket_params[:report]
      upload_file(report)
      admin_ticket_params[:report] = report.original_filename
      params[:report] = admin_ticket_params[:report].original_filename

      RentMailer.close_ticket_mail(current_user).deliver_now
    end

    cliente_role = current_user.has_role? :cliente
    if @admin_ticket.flow.stage == 6 && cliente_role
      if params[:rollout_approve_installation] == "0"
        plus_step = false
        jump_steps = 2
      end
    end

    flow = @admin_ticket.flow
    if plus_step
      flow.stage += 1
    else
      flow.stage -= jump_steps
    end
    flow.role_id = current_user.roles.first.id

    respond_to do |format|
      if @admin_ticket.update(params) && flow.save
        format.html { redirect_to @admin_ticket, notice: 'Ticket atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_ticket }
      else
        format.html { render :edit }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tickets/1
  # DELETE /admin/tickets/1.json
  def destroy
    authorize! :destroy, Admin::Ticket

    @admin_ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ticket
      @admin_ticket = Admin::Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_ticket_params
      params.require(:admin_ticket).permit(:flow_id, :ticket_type, :cnpj, :name, :description, :city, :state, :address, :audio, :dossier, :dossier_status, :debits_status, :comercial_status, :rollout_customer_validate, :rollout_customer_verification, :rollout_eps_details, :rollout_date_inform, :consolidate_schedule, :rollout_approve_installation, :report, :dt_one, :dt_two, :dt_three)
    end

    def upload_file(io)
      File.open(Rails.root.join('public', 'uploads', io.original_filename), 'wb') do |file|
        file.write(io.read)
      end
    end
end
