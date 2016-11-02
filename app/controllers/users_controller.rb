class UsersController < ApplicationController
  protect_from_forgery
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      @errors = user.errors.full_messages
      render new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
