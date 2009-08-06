class Admin::AdminController < ApplicationController
  layout :skip_layout_if_xhr
  
protected
  def skip_layout_if_xhr
    request.xhr? ? false : "admin"
  end
end
