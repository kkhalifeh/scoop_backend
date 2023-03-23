# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_23_094526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.string "updated_at"
    t.string "created_at"
  end

  create_table "list_places", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "place_id", null: false
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_places_on_list_id"
    t.index ["place_id"], name: "index_list_places_on_place_id"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.integer "pinned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["location_id"], name: "index_lists_on_location_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_pins_on_list_id"
    t.index ["user_id"], name: "index_pins_on_user_id"
  end

  create_table "place_categories", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "category_id", null: false
    t.bigint "list_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_place_categories_on_category_id"
    t.index ["list_id"], name: "index_place_categories_on_list_id"
    t.index ["place_id"], name: "index_place_categories_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "google_id"
    t.string "name"
    t.string "img_url"
    t.string "formatted_address"
    t.string "formatted_phone_number"
    t.json "location"
    t.string "website"
    t.string "rating"
    t.string "photo_ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "firebase_uid"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_number"], name: "index_users_on_mobile_number", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "lists", "users"
  add_foreign_key "pins", "lists"
  add_foreign_key "pins", "users"
  add_foreign_key "place_categories", "categories"
  add_foreign_key "place_categories", "lists"
  add_foreign_key "place_categories", "places"
end
