class PolymorphicFeeds < ActiveRecord::Migration
  def self.up
    change_table :feeds do |t|
      t.string :type
    end
  end

  def self.down
    change_table :feeds do |t|
      t.remove :type
    end
  end
end
