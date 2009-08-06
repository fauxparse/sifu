class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.belongs_to :author
      t.string     :type
      t.string     :title
      t.text       :summary
      t.text       :body
      t.string     :state
      t.integer    :comments_count, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
