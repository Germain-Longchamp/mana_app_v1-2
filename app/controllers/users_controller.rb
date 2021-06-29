class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

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
    @user.save
    redirect_to company_path(current_user.company_id)
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
    params.require(:user).permit(:email, :password, :avatar, :firstname, :lastname, :position, :company_id)
  end
end
