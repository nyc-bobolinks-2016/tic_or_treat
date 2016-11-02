class SessionsController < ApplicationController
  protect_from_forgery

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      if session[:game_id]
        Game.find_by(id: session[:game_id]).update(user_id: user.id)
      end
      redirect_to root_path
    else
      @errors = ['incorrect username or email']
      render sessions_new_path
    end
  end


  def delete
    session.clear
    redirect_to root_path
  end

end
