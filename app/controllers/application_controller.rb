# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :check_site_configuration
  
protected
  # Checks to see if the application has been set up correctly.
  def check_site_configuration
    redirect_to new_admin_setup_path unless Site.configured?
    Time.zone = Site.time_zone
  end
end
