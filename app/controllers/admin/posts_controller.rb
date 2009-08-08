class Admin::PostsController < Admin::AdminController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
end
