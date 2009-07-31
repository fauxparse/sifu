require "open-uri"

class Feed < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  validates_presence_of :name, :url
  
  def to_json
    entries.to_json
  end
  
  def entries
    (parsed/:item)[0,10].collect do |item|
      Entry.new *(%w(title description pubDate link guid).collect { |f| (item / f.to_sym).inner_html })
    end
  end
  memoize :entries
  
  def parsed
    Hpricot.XML(data)
  end
  memoize :parsed
  
  def data(refresh = false)
    self.refresh if refresh || self[:data].blank?
    super
  end
  
  def refresh
    begin
      write_attribute :data, open(url).read
      unmemoize_all
      save
    rescue Exception => e
      # TODO: proper error handling
    end
  end
  
  class Entry
    attr_reader :title, :description, :date, :link, :guid
    
    def initialize(title, description, date, link, guid)
      @title       = title
      @description = description
      @date        = date
      @link        = link
      @guid        = guid
    end
  end
end
