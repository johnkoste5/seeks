class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # This is the method we are using when grabbing current_user
  # THis method is available to us on any controller or on any partial
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
  	redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end

  # def current_secret_id
  #   Secret.find(session[:secret_id]) if session[:secret_id]
  # end

  # I like where yuor goind with this lets clean it up a little bit

  helper_method :current_user
end
