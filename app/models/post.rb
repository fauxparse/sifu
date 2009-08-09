class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :published_at
  
  default_value_for(:published_at) { Time.zone.now }
end
