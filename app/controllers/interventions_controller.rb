class InterventionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_intervention, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /interventions or /interventions.json
  def index
    # Get all interventions
    @interventions = Intervention.where(:company_id => current_user.company_id).order("created_at DESC")

    # Get all engines
    @engines = Engine.where(:company_id => current_user.company_id)


    # Get In progress Interventions
    @progress_issues = Issue.where(:company_id => current_user.company_id).where(:status => 'encours').order("created_at DESC")

    # Get resolved Interventions -- TO DO

    # Get Archived Interventions -- TO DO


    # Get all Interventions Categories
    @interventions_categories = InterventionCategory.where(:company_id => current_user.company_id)
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.company_id = current_user.company_id
    @intervention.user_id = current_user.id

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:name, :detail, :user_id, :engine_id, :company_id, :intervention_category_id)
    end
end
