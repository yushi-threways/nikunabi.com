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

ActiveRecord::Schema.define(version: 2018_10_22_095054) do

  create_table "addresses", force: :cascade do |t|
    t.integer "shop_id"
    t.string "street"
    t.string "zipcode"
    t.string "building"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_addresses_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_addresses_on_shop_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index [nil], name: "index_admins_on_confirmation_token", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "admin_id"
    t.string "title"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id", "created_at"], name: "index_blogs_on_admin_id_and_created_at"
    t.index ["admin_id"], name: "index_blogs_on_admin_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "prefecturecode"
    t.string "prefecture"
    t.string "prefecturekana"
    t.string "citycode"
    t.string "city"
    t.string "citykana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_rooms", force: :cascade do |t|
    t.integer "detail_id"
    t.integer "room_id"
    t.index ["detail_id"], name: "index_detail_rooms_on_detail_id"
    t.index ["room_id"], name: "index_detail_rooms_on_room_id"
  end

  create_table "detail_scenes", force: :cascade do |t|
    t.integer "detail_id"
    t.integer "scene_id"
    t.index ["detail_id"], name: "index_detail_scenes_on_detail_id"
    t.index ["scene_id"], name: "index_detail_scenes_on_scene_id"
  end

  create_table "details", force: :cascade do |t|
    t.integer "shop_id"
    t.string "image"
    t.string "open", null: false
    t.string "holiday", null: false
    t.string "access", null: false
    t.string "parking", null: false
    t.string "concept"
    t.string "account"
    t.string "payment"
    t.string "facility"
    t.string "light"
    t.string "vibe"
    t.integer "party"
    t.string "smoking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_details_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_details_on_shop_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.integer "admin_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id", "created_at"], name: "index_information_on_admin_id_and_created_at"
    t.index ["admin_id"], name: "index_information_on_admin_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "shop_id"
    t.string "name", null: false
    t.string "image"
    t.string "price", null: false
    t.string "quantity"
    t.string "bake"
    t.string "taste"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_menus_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_menus_on_shop_id"
  end

  create_table "prides", force: :cascade do |t|
    t.integer "shop_id"
    t.string "image"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_prides_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_prides_on_shop_id"
  end

  create_table "recommends", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
  end

  create_table "scenes", force: :cascade do |t|
    t.string "name"
  end

  create_table "shop_features", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "feature_id"
    t.index ["feature_id"], name: "index_shop_features_on_feature_id"
    t.index ["shop_id"], name: "index_shop_features_on_shop_id"
  end

  create_table "shop_recommends", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "recommend_id"
    t.index ["recommend_id"], name: "index_shop_recommends_on_recommend_id"
    t.index ["shop_id"], name: "index_shop_recommends_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "telNumber", default: "", null: false
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
