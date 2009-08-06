class User < ActiveRecord::Base
  belongs_to :site

  validates_presence_of :first_name, :last_name
  
  acts_as_authentic do |config|
    # configuration goes here
  end
  
  def name
    [ first_name, last_name ].reject(&:blank?).join(" ")
  end
  alias_method :to_s, :name
end
