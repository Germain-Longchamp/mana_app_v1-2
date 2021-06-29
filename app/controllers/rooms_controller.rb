class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ edit update destroy ]

  def index
    @rooms = Room.where(:company_id => current_user.company_id).order('name')
  end

  def show
    if @room.company_id != current_user.company_id
      redirect_to rooms_path
    end
  end

  def new
    @room = Room.new
  end

  def edit
    if @room.company_id != current_user.company_id
      redirect_to rooms_path
    end
  end

  def create
    @room = Room.new(room_params)
    @room.company_id = current_user.company_id
    @room.save
    redirect_to rooms_path
  end

  def update
      respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_url, notice: 'My Notice.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "La salle a bien été supprimée" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :company_id)
    end
end
