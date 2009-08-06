class Admin::SessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    if logged_in?
      current_user_session.destroy
      @current_user_session, @current_user = nil, nil
    end

    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
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
    current_user_session.destroy
    @current_user_session, @current_user = nil, nil
    
    if request.xhr?
      render :partial => "ajax_login"
    else
      flash[:notice] = "You have been logged out"
      redirect_back_or_default new_user_session_url
    end
  end
end
