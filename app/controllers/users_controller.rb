class UsersController < ApplicationController
  protect_from_forgery
  skip_before_filter :verify_authenticity_token
  def index
  end

  def show
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
