class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: %i[ edit update destroy ]
  load_and_authorize_resource

  def index
    @issues = Issue.where(:company_id => current_user.company_id).order('name')
    #GET ALL ENGINES
    @engines = Engine.where(:company_id => current_user.company_id)
  end

  #def show
  #end

  def new
    @issue = Issue.new
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.company_id = current_user.company_id

    respond_to do |format|
      if @issue.save
        format.js
        format.json { render json: @issue.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
     if @issue.update(issue_params)
       format.html { redirect_to issues_path, notice: 'My Notice.' }
       format.json { render :show, status: :created, location: @issue }
     else
       format.html { render :edit, status: :unprocessable_entity }
       format.json { render json: @issue.errors, status: :unprocessable_entity }
     end
   end
  end

  def destroy
    @issue.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to issues_url, notice: "L'incident a bien été supprimé" }
        format.json { head :no_content }
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:name, :company_id, :engine_id)
    end
end
