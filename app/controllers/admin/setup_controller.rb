class Admin::SetupController < ApplicationController
  def new
    Site.instance.users.build if Site.instance.users.empty?
  end
  
  def create
    if Site.configure_with params[:site]
      redirect_to "/"
    else
      render :action => :new
    end
  end
  
protected
  def check_site_configuration
    redirect_to root_url if Site.configured?
  end
end
