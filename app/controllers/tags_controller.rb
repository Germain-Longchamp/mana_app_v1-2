class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[ edit update destroy ]

  def index
    @tags = Tag.all
  end

  # GET /engines/new
  def new
    @tag = Tag.new
  end

  # GET /engines/1/edit
  def edit
  end

  # POST /engines or /engines.json
  def create
    @tag = Tag.new(tag_params)

    @tag.save
    redirect_to tags_path
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_url, notice: 'My Notice.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
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