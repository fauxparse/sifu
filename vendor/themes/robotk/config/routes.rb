ActionController::Routing::Routes.draw do |map|
  map.primary_tag "/:tag", :controller => "posts", :action => "index"
end
