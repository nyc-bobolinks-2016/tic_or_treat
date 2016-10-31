module ApplicationHelper

  def current_user
    return User.find(session[:user_id]) if session[:user_id]
    false
  end

end
