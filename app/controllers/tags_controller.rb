class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[ edit update destroy ]

  def index
    @tags = Tag.where(:company_id => current_user.company_id).order('name')
  end

  # GET /engines/new
  def new
    @tag = Tag.new
  end

  # GET /engines/1/edit
  def edit
    if @tag.company_id != current_user.company_id
      redirect_to settings_tags_path
    end
  end

  # POST /engines or /engines.json
  def create

    @tag = Tag.new(tag_params)
    @tag.company_id = current_user.company_id
    

    respond_to do |format|
      if @tag.save
        format.js
        format.json { render json: @tag.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to settings_tags_url, notice: 'My Notice.' }
        format.json { render :show, status: :created, location: @tag }
        flash[:notice] = 'Tag mis à jour'
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
        flash[:alert] = 'Un problème est survenu'
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to tags_url, notice: "La famille a bien été supprimée" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :tag_color, :company_id)
    end
end