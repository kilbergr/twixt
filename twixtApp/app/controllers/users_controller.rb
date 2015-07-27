class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
  	#don't want to use--no reason to see all users but could be find your friends potentially
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create user_params
  	redirect_to user_path
  end

  def edit
  end

  def update
  	@user.update user_params
  	@user.save
  	redirect_to user_path
  end

  def show
  end

  def destroy 
  	@user.destroy
  	redirect_to users_path
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :avatar, :birthday) 
  end

  def find_user
  		@user = User.find_by_id(params[:id])
  end

end
