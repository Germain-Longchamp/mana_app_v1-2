class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_engine, only: %i[ show edit update destroy ]

  # GET /engines or /engines.json
  def index
    # GET all tags on engines index
    @tags = Tag.all
    # GET all rooms on engines index
    @rooms = Room.all
    # GET Engines count
    @all_engines = Engine.where(:company_id => current_user.company_id).all

    if params[:tag].present?
      @engines = Engine.where(:company_id => current_user.company_id).tagged_with(params[:tag]).paginate(page: params[:page], per_page: 20)

    elsif params[:room].present?
      @engines = Engine.where(:company_id => current_user.company_id).roomed_with(params[:room]).paginate(page: params[:page], per_page: 20)

    elsif params[:page]
      @engines = Engine.where(:company_id => current_user.company_id).paginate(page: params[:page], per_page: 20)

    else
      @engines = Engine.where(:company_id => current_user.company_id).all.paginate(page: params[:page], per_page: 20)
    end
    
  end

  # GET /engines/1 or /engines/1.json
  def show
    if @engine.company_id != current_user.company_id
      redirect_to engines_path
    end
  end

  # GET /engines/new
  def new
    @engine = Engine.new
  end

  # GET /engines/1/edit
  def edit
    if @engine.company_id != current_user.company_id
      redirect_to engines_path
    end
  end

  # POST /engines or /engines.json
  def create
    @engine = Engine.new(engine_params)

    respond_to do |format|
      if @engine.save
        format.html { redirect_to @engine, notice: "Engine was successfully created." }
        format.json { render :show, status: :created, location: @engine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @engine.update(engine_params)
        format.html { redirect_to @engine, notice: "Engine was successfully updated." }
        format.json { render :show, status: :ok, location: @engine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engines/1 or /engines/1.json
  def destroy
    @engine.destroy
    respond_to do |format|
      format.html { redirect_to engines_url, notice: "Engine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engine
      @engine = Engine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engine_params
      params.require(:engine).permit(:name, :internal_name, :description, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :room_id, :initial_date, :company_id)
    end
end
