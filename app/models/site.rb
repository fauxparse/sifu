class Site < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users
  
  class << self
    def instance(force_reload = false)
      (force_reload || !@instance) ? (@instance = (find(:first) || new)) : @instance
    end

    def configured?
      !instance.new_record?
    end
    
    def configure_with(params = {})
      instance(true).update_attributes params
    end
    
    def method_missing(symbol, *args)
      instance.send symbol, *args
    end
  end
end
