# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  extend ActiveSupport::Memoizable

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  before_filter :check_site_configuration
  
  helper_method :current_user_session, :current_user, :logged_in?

protected
  # Checks to see if the application has been set up correctly.
  def check_site_configuration
    redirect_to new_admin_setup_path unless Site.configured?
    Time.zone = Site.time_zone
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
    
  def logged_in?
    !!current_user
  end
  
  def log_out!
    current_user_session.destroy
    @current_user = nil
    @current_user_session = nil
  end
    
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to admin_login_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
