# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130308051428) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["trackable_id"], :name => "index_activities_on_trackable_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "buildings", :force => true do |t|
    t.string    "address"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.float     "longitude"
    t.float     "latitude"
    t.decimal   "tagid"
    t.string    "name"
  end

  create_table "rooms", :force => true do |t|
    t.string    "name"
    t.decimal   "temp"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.decimal   "building_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "votes", :force => true do |t|
    t.decimal   "amount"
    t.decimal   "room_id"
    t.decimal   "user_id"
    t.float     "latitude"
    t.float     "longitude"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.decimal   "building_id"
  end

end
