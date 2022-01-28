class InterventionCategoriesController < ApplicationController
  before_action :set_intervention_category, only: %i[ show edit update destroy ]

  # GET /intervention_categories or /intervention_categories.json
  def index
    @intervention_categories = InterventionCategory.all
  end

  # GET /intervention_categories/1 or /intervention_categories/1.json
  def show
  end

  # GET /intervention_categories/new
  def new
    @intervention_category = InterventionCategory.new
  end

  # GET /intervention_categories/1/edit
  def edit
  end

  # POST /intervention_categories or /intervention_categories.json
  def create
    @intervention_category = InterventionCategory.new(intervention_category_params)

    respond_to do |format|
      if @intervention_category.save
        format.html { redirect_to @intervention_category, notice: "Intervention category was successfully created." }
        format.json { render :show, status: :created, location: @intervention_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervention_categories/1 or /intervention_categories/1.json
  def update
    respond_to do |format|
      if @intervention_category.update(intervention_category_params)
        format.html { redirect_to @intervention_category, notice: "Intervention category was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention_categories/1 or /intervention_categories/1.json
  def destroy
    @intervention_category.destroy
    respond_to do |format|
      format.html { redirect_to intervention_categories_url, notice: "Intervention category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention_category
      @intervention_category = InterventionCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_category_params
      params.require(:intervention_category).permit(:name, :description)
    end
end
