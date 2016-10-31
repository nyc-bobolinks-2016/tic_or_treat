class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect
    else
      @errors = ['incorrect username or email']
      render
    end
  end


  def delete
    session.clear
  end

end
