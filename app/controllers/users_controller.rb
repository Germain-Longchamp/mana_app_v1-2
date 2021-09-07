class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.company_id = current_user.company_id
    
    respond_to do |format|
      if @user.save
        format.js
        format.json { render json: @user.id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to company_path(current_user.company_id), notice: 'Utilisateur Mis à jour.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to company_path(current_user.company_id)
  end

  def profile
   @user = current_user
 end

 private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :avatar, :firstname, :lastname, :position, :company_id, :picture)
  end
end
