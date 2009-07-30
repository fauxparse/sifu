class User < ActiveRecord::Base
  belongs_to :site
  
  acts_as_authentic do |config|
    # configuration goes here
  end
end
