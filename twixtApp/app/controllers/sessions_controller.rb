class SessionsController < ApplicationController
   # before_action :prevent_login_signup, only: [:signup, :login]
  def signup
  	@user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to groups_path
    else
      render :signup
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to groups_path
      else
        flash[:alert] = "email / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter email and password"
      redirect_to login_path
    end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "Logged out"
    redirect_to login_path
  end


  private
  def user_params
  	params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :avatar, :birthday) 
  end

  def find_user
  		@user = User.find_by_id(params[:id])
  end


end
