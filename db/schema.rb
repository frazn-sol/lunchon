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

ActiveRecord::Schema.define(:version => 20121215174632) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "deal_id"
    t.text     "message"
    t.string   "contributor"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contract_conditions", :force => true do |t|
    t.integer "contract_id"
    t.string  "verbage"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "restaurant_id"
    t.decimal  "price",           :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "value",           :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.integer  "number_of_deals"
    t.decimal  "total_discount",  :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "image"
    t.integer  "contract_id"
    t.text     "description"
    t.decimal  "original_price",     :precision => 10, :scale => 2
    t.integer  "quantity_purchased"
  end

  add_index "deals", ["contract_id"], :name => "index_deals_on_restaurant_id"

  create_table "locations", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "hours"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "locations", ["restaurant_id"], :name => "index_locations_on_restaurant_id"

  create_table "purchase_items", :force => true do |t|
    t.integer  "purchase_id"
    t.string   "deal_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "redemption_code"
    t.datetime "redeemed_at"
  end

  add_index "purchase_items", ["redemption_code"], :name => "index_purchase_items_on_redemption_code"

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.string   "cc_transaction_id"
    t.decimal  "price",               :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.decimal  "discount_percentage", :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "ratings", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.float    "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "redemptions", :force => true do |t|
    t.integer  "purchase_item_id"
    t.string   "code"
    t.boolean  "redeemable"
    t.datetime "requested_at"
    t.datetime "redeemed_at"
    t.integer  "redeemed_by"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
