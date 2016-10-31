module ApplicationHelper

  def current_user
    return User.find(session[:id]) if session[:id]
    nil
  end

end
