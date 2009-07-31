class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string     :name
      t.string     :url
      t.text       :data
      t.timestamps
    end
    
    add_index :feeds, [ :name ]
  end

  def self.down
    remove_index :feeds, [ :name ]
    drop_table :feeds
  end
end
