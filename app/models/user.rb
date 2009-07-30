class User < ActiveRecord::Base
  belongs_to :site

  validates_presence_of :first_name, :last_name
  
  acts_as_authentic do |config|
    # configuration goes here
  end
end
