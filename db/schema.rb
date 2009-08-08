# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090808022640) do

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "feeds", ["name"], :name => "index_feeds_on_name"

  create_table "posts", :force => true do |t|
    t.integer  "author_id"
    t.string   "type"
    t.string   "title"
    t.text     "summary"
    t.text     "body"
    t.string   "state"
    t.integer  "comments_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  create_table "sites", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "site_id"
    t.string   "first_name",          :default => "", :null => false
    t.string   "last_name",           :default => "", :null => false
    t.string   "login",               :default => "", :null => false
    t.string   "email",               :default => "", :null => false
    t.string   "crypted_password",    :default => "", :null => false
    t.string   "password_salt",       :default => "", :null => false
    t.string   "persistence_token",   :default => "", :null => false
    t.string   "single_access_token", :default => "", :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["site_id", "login"], :name => "index_users_on_site_id_and_login"

end
