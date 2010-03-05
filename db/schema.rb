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

ActiveRecord::Schema.define(:version => 20100302082945) do

  create_table "cart_items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     :default => true
  end

  create_table "keepers", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_shipments", :force => true do |t|
    t.float    "price"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "state"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "shipment_type"
    t.string   "payment_type"
    t.float    "shipment_price", :default => 0.0
  end

  create_table "pages", :force => true do |t|
    t.string   "about_us"
    t.string   "terms_and_conditions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact"
    t.string   "faq"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "product_id"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "size"
    t.float    "price"
    t.integer  "count"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",      :default => true
  end

  create_table "settings", :force => true do |t|
    t.float    "shipping_ceska_posta_price"
    t.string   "bank_account_number"
    t.string   "bank_account_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"
  add_index "slugs", ["sluggable_type", "scope", "sequence"], :name => "index_slugs_on_sluggable_type_and_scope_and_sequence"

  create_table "user_cart_items", :force => true do |t|
    t.integer "quantity"
    t.integer "user_id"
    t.integer "product_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",             :default => true
    t.string   "city"
    t.string   "name"
    t.string   "post_code"
    t.string   "street"
  end

end
