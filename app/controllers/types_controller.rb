class TypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type, only: %i[ edit update destroy ]

  def index
    @types = Type.where(:company_id => current_user.company_id)
  end

   def new
    @type = Type.new
  end

  def edit
    if @type.company_id != current_user.company_id
      redirect_to settings_types
    end
  end

  def create
    @type = Type.new(type_params)
    @type.company_id = current_user.company_id
    
    respond_to do |format|
      if @type.save
        format.js
        format.json { render json: @type.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to settings_types, notice: 'My Notice.' }
        format.json { render :show, status: :created, location: @type }
        flash[:notice] = 'Catégorie mis à jour'
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type.errors, status: :unprocessable_entity }
        flash[:alert] = 'Un problème est survenu'
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root, notice: "La catégorie a bien été supprimée" }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name, :company_id)
    end
end
