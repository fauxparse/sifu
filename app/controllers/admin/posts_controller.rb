class Admin::PostsController < Admin::AdminController
  def admin
    @posts = Posts.all
  end
end
