class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.belongs_to :site
      t.string     :first_name,          :null => false
      t.string     :last_name,           :null => false
      t.string     :login,               :null => false
      t.string     :email,               :null => false
      t.string     :crypted_password,    :null => false
      t.string     :password_salt,       :null => false
      t.string     :persistence_token,   :null => false
      t.string     :single_access_token, :null => false
      t.string     :perishable_token,    :null => false
      t.timestamps
    end
    
    add_index :users, [ :site_id, :login ]
  end

  def self.down
    remove_index :users, [ :site_id, :login ]
    drop_table :users
  end
end
