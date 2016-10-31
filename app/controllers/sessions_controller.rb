class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
    else
      @errors = ['incorrect username or email']
    end
  end


  def delete
    session.clear
  end
  
end
