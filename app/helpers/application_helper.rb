module ApplicationHelper
  def current_user
    session[:user_id] ? User.find_by(id: session[:user_id]) : false
  end
end
