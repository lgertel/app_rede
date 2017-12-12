class Admin::FlowsController < ApplicationController
  before_action :set_admin_flow, only: [:show, :edit, :update, :destroy]

  # GET /admin/flows
  # GET /admin/flows.json
  def index
    @admin_flows = Admin::Flow.all
  end

  # GET /admin/flows/1
  # GET /admin/flows/1.json
  def show
  end

  # GET /admin/flows/new
  def new
    @admin_flow = Admin::Flow.new
  end

  # GET /admin/flows/1/edit
  def edit
  end

  # POST /admin/flows
  # POST /admin/flows.json
  def create
    @admin_flow = Admin::Flow.new(admin_flow_params)

    respond_to do |format|
      if @admin_flow.save
        format.html { redirect_to @admin_flow, notice: 'Flow was successfully created.' }
        format.json { render :show, status: :created, location: @admin_flow }
      else
        format.html { render :new }
        format.json { render json: @admin_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/flows/1
  # PATCH/PUT /admin/flows/1.json
  def update
    respond_to do |format|
      if @admin_flow.update(admin_flow_params)
        format.html { redirect_to @admin_flow, notice: 'Flow was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_flow }
      else
        format.html { render :edit }
        format.json { render json: @admin_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/flows/1
  # DELETE /admin/flows/1.json
  def destroy
    @admin_flow.destroy
    respond_to do |format|
      format.html { redirect_to admin_flows_url, notice: 'Flow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_flow
      @admin_flow = Admin::Flow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_flow_params
      params.require(:admin_flow).permit(:flow_type, :stage, :role_id)
    end
end
