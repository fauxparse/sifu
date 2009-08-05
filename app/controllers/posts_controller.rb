class PostsController < ApplicationController
  def index
    @tag = params[:tag]
  end
end
