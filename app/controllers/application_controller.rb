class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :redirect_path
  private

  def authenticate_user!
    unless current_user
      cookies[:path] = request.path
      redirect_to login_path, alert: 'Are you a Guru? Verify your email and password please'
    end
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_path
    cookies[:path].delete(:path) || tests_path
  end
end
