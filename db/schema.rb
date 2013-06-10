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

ActiveRecord::Schema.define(:version => 20130517214702) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "basket_items", :force => true do |t|
    t.integer "basket_id"
    t.integer "product_id"
    t.integer "count",      :default => 1
  end

  create_table "baskets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_mails", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "application_name", :default => "obelisk", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "reference"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "application_name", :default => "obelisk", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "article",          :limit => 6,                   :null => false
    t.string   "name",             :limit => 50,                  :null => false
    t.string   "height",           :limit => 10
    t.string   "width",            :limit => 10
    t.string   "notes"
    t.string   "small_image_name", :limit => 50
    t.string   "big_image_name",   :limit => 50
    t.string   "extra_image_name", :limit => 50
    t.decimal  "price",                                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "may9",                           :default => "0", :null => false
    t.string   "small_img"
    t.string   "medium_img"
    t.string   "big_img"
  end

  create_table "revisions", :force => true do |t|
    t.integer  "page_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
