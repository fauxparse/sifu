class Admin::SetupController < ApplicationController
  def new
    @site = returning Site.instance do |site|
      site.users.build :login => "admin"
    end
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
