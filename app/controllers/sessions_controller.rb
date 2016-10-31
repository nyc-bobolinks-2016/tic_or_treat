class SessionsController < ApplicationController
  protect_from_forgery
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
       p session[:user_id] = @user.id
       p session[:user_id]
      redirect_to root_path
    else
      @errors = ['incorrect username or email']
      redirect_to root_path
    end
  end


  def delete
    session.clear
    redirect_to root_path
  end

end
