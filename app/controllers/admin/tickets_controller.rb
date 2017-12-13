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
    print(current_user.roles.inspect)
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

    flow = @admin_ticket.flow
    flow.stage += 1
    flow.role_id = current_user.roles.first.id

    respond_to do |format|
      if @admin_ticket.update(admin_ticket_params) && flow.save
        format.html { redirect_to @admin_ticket, notice: 'Ticket was successfully updated.' }
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
      params.require(:admin_ticket).permit(:flow_id, :ticket_type, :cnpj, :name, :description, :city, :state, :address, :audio, :dossier, :report)
    end
end
