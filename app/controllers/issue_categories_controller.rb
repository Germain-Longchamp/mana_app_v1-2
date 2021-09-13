class IssueCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue_category, only: %i[ edit update destroy ]

  def index
    @issue_categories = IssueCategory.where(:company_id => current_user.company_id)
  end

   def new
    @issue_category = IssueCategory.new
  end

  def edit
    if @tag.company_id != current_user.company_id
      redirect_to settings_path
    end
  end

  def create
    @issue_category = IssueCategory.new(issue_category_params)
    @issue_category.company_id = current_user.company_id
    
    respond_to do |format|
      if @issue_category.save
        format.js
        format.json { render json: @issue_category.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue_category.update(issue_category_params)
        format.html { redirect_to settings_url, notice: 'My Notice.' }
        format.json { render :show, status: :created, location: @issue_category }
        flash[:notice] = 'Catégorie mis à jour'
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue_category.errors, status: :unprocessable_entity }
        flash[:alert] = 'Un problème est survenu'
      end
    end
  end

  def destroy
    @issue_category.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to settings_url, notice: "La catégorie a bien été supprimée" }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_category
      @issue_category = IssueCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_category_params
      params.require(:issue_category).permit(:name, :company_id)
    end
end
