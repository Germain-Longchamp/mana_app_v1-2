class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: %i[ edit update destroy ]
  load_and_authorize_resource

  def index
    #GET ALL ISSUES 
    @issues = Issue.where(:company_id => current_user.company_id).order("created_at DESC")

    #GET ALL ENGINES
    @engines = Engine.where(:company_id => current_user.company_id)

    #GET ENCOURS ISSUES
    @progress_issues = Issue.where(:company_id => current_user.company_id).where(:status => 'encours').order("created_at DESC")

    #GET RESOLVED ISSUES
    @resolved_issues = Issue.where(:company_id => current_user.company_id).where(:status => 'resolu').order("updated_at DESC")

    # ARCHIVED ISSUES
    @archived_issues = Issue.where(:company_id => current_user.company_id).where(:status => 'archived')

    #GET ALL ISSUES CATEGORIES
    @types = Type.where(:company_id => current_user.company_id)
  end

  def archive
    #GET ARCHIVED ISSUES
    @archived_issues = Issue.where(:company_id => current_user.company_id).where(:status => 'archived').order("updated_at DESC")
  end

  def show
  end

  def new
    @issue = Issue.new
  end

  def edit
    Rails.logger.debug("-----------------------------------------")
    Rails.logger.debug(request.referrer)

    url = request.referrer

    if request.referrer.include?("/issues")
      Rails.logger.debug(url)
    else
      Rails.logger.debug("on redirige sur engine")
    end
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.company_id = current_user.company_id
    @issue.user_id = current_user.id
    @issue.status = 'encours'

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
    @issue.status = 'resolu'

    respond_to do |format|
     if @issue.update(issue_params)
       format.html { redirect_to issues_path, notice: "Issue was successfully updated." }
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
      params.require(:issue).permit(:name,
                                    :type_id,
                                    :company_id, 
                                    :engine_id, 
                                    :info, 
                                    :start_date, 
                                    :status, 
                                    :validation_file)
    end
end
