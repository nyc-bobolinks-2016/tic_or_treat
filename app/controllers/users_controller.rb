class UsersController < ApplicationController
  protect_from_forgery
  def index
  end

  def show
    if session[:user_id] == params[:id]
      @user = User.find_by(id: params[:id])
      render 'show'
    elsif session[:user_id]
      @user = User.find_by(id: session[:user_id])
      render 'show'
    else
      redirect_to sessions_new_path
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      if session[:game_id]
        Game.find_by(id: session[:game_id]).update(user_id: user.id)
      end
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
