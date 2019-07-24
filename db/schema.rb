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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_24_085040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.datetime "date"
    t.text "description"
    t.integer "rating"
    t.integer "capacity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_categories", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_categories_on_activity_id"
    t.index ["category_id"], name: "index_activity_categories_on_category_id"
  end

  create_table "activity_images", force: :cascade do |t|
    t.bigint "activity_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_images_on_activity_id"
  end

  create_table "activity_reviews", force: :cascade do |t|
    t.bigint "order_id"
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_activity_reviews_on_order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_favorites_on_activity_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.integer "number_of_tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_orders_on_activity_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "activity_categories", "activities"
  add_foreign_key "activity_categories", "categories"
  add_foreign_key "activity_images", "activities"
  add_foreign_key "activity_reviews", "orders"
  add_foreign_key "favorites", "activities"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "activities"
  add_foreign_key "orders", "users"
end
