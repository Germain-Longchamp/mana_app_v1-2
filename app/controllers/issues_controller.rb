class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: %i[ edit update destroy ]

  def index
    @issues = Issue.where(:company_id => current_user.company_id).order('name')
  end

  #def show
  #end

  def new
    @issue = Issue.new
  end

  #def edit
  #end

  def create
    @issue = Issue.new(issue_params)
    @issue.company_id = current_user.company_id

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: "Issue was successfully created." }
        format.json { render json: @issue.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  #def update
  #end

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
      params.require(:issue).permit(:name, :company_id)
    end
end
