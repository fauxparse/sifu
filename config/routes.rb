ActionController::Routing::Routes.draw do |map|
  map.namespace "admin" do |admin|
    admin.resource :setup, :controller => "setup"
    admin.resource :session
  end
  
  map.resources :feeds
  map.root :controller => "posts", :action => "index"
end
