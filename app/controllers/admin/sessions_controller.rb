class Admin::SessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    log_out! if logged_in?
    logger.info logged_in?.inspect

    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @current_user_session, @current_user = @user_session, @user_session.record
      if request.xhr?
        render :partial => "ajax_login"
      else
        flash[:notice] = "Login successful!"
        redirect_back_or_default account_url
      end
    else
      if request.xhr?
        flash.now[:login_error] = "Invalid username or password."
        render :partial => "ajax_login"
      else
        render :action => :new
      end
    end
  end
  
  def destroy
    log_out!
    
    if request.xhr?
      render :partial => "ajax_login"
    else
      flash[:notice] = "You have been logged out"
      redirect_to root_url
    end
  end
end
