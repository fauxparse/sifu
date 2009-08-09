class Admin::PostsController < Admin::AdminController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new params[:post]
    respond_to do |format|
      if @post.save
        format.html do |variable|
          flash[:notice] = "Post created."
          redirect_to admin_posts_path
        end
        format.js
      else
        format.html do
          render :action => "new" 
        end
        format.js
      end
    end
  end
end
