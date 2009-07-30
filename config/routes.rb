ActionController::Routing::Routes.draw do |map|
  map.namespace "admin" do |admin|
    admin.resource :setup, :controller => "setup"
  end
  
  map.root :controller => "posts", :action => "index"
end
