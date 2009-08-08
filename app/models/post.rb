class Post < ActiveRecord::Base
  default_value_for(:published_at) { Time.zone.now }
end
