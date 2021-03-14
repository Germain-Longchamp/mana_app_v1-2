class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[ destroy ]

  def index
    @tags = Tag.all
  end

  # GET /engines/new
  def new
    @tag = Tag.new
  end

  # POST /engines or /engines.json
  def create
        @tag = Tag.new(tag_params)

        @tag.save
        redirect_to tags_path
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
      params.require(:tag).permit(:name)
    end
end