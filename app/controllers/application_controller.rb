class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    User.find_by(uid: session[:uid]) if session[:uid]
  end
end
