class UsersController < ApplicationController
  protect_from_forgery
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def current_user
    @user = User.find(params[:id])
  end
end
