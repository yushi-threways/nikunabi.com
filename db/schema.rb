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

ActiveRecord::Schema.define(version: 2019_02_18_065235) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "city_id"
    t.bigint "area_id"
    t.string "zipcode"
    t.string "prefecture", default: "愛知県"
    t.string "street"
    t.string "full_address"
    t.float "latitude"
    t.float "longitude"
    t.string "station"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_addresses_on_area_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["shop_id", "created_at"], name: "index_addresses_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_addresses_on_shop_id"
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "areacode"
    t.string "name"
  end

  create_table "blog_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "blog_id"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_pictures_on_blog_id"
  end

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_id"
    t.string "main_title"
    t.string "title_01"
    t.string "title_02"
    t.string "title_03"
    t.string "title_04"
    t.text "main_content"
    t.text "content_01"
    t.text "content_02"
    t.text "content_03"
    t.text "content_04"
    t.string "main_image"
    t.string "image_01"
    t.string "image_02"
    t.string "image_03"
    t.string "image_04"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id", "created_at"], name: "index_blogs_on_admin_id_and_created_at"
    t.index ["admin_id"], name: "index_blogs_on_admin_id"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "citycode"
    t.string "city"
    t.string "citykana"
  end

  create_table "detail_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "detail_id"
    t.bigint "room_id"
    t.index ["detail_id"], name: "index_detail_rooms_on_detail_id"
    t.index ["room_id"], name: "index_detail_rooms_on_room_id"
  end

  create_table "detail_scenes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "detail_id"
    t.bigint "scene_id"
    t.index ["detail_id"], name: "index_detail_scenes_on_detail_id"
    t.index ["scene_id"], name: "index_detail_scenes_on_scene_id"
  end

  create_table "details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
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
    t.integer "table"
    t.integer "seat"
    t.integer "party"
    t.string "smoking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_details_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_details_on_shop_id"
  end

  create_table "features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id", "created_at"], name: "index_information_on_admin_id_and_created_at"
    t.index ["admin_id"], name: "index_information_on_admin_id"
  end

  create_table "menu_books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "images"
    t.index ["shop_id"], name: "index_menu_books_on_shop_id"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
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

  create_table "prides", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "image"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_prides_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_prides_on_shop_id"
  end

  create_table "recommends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "scenes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "shop_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "title"
    t.text "content"
    t.string "image"
    t.date "closed_at"
    t.date "published_at"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id", "created_at"], name: "index_shop_events_on_shop_id_and_created_at"
    t.index ["shop_id"], name: "index_shop_events_on_shop_id"
  end

  create_table "shop_features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "feature_id"
    t.index ["feature_id"], name: "index_shop_features_on_feature_id"
    t.index ["shop_id"], name: "index_shop_features_on_shop_id"
  end

  create_table "shop_recommends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "recommend_id"
    t.index ["recommend_id"], name: "index_shop_recommends_on_recommend_id"
    t.index ["shop_id"], name: "index_shop_recommends_on_shop_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "telNumber", default: "", null: false
    t.index ["confirmation_token"], name: "index_shops_on_confirmation_token", unique: true
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  add_foreign_key "addresses", "areas"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "shops"
  add_foreign_key "blog_pictures", "blogs"
  add_foreign_key "blogs", "admins"
  add_foreign_key "detail_rooms", "details"
  add_foreign_key "detail_rooms", "rooms"
  add_foreign_key "detail_scenes", "details"
  add_foreign_key "detail_scenes", "scenes"
  add_foreign_key "details", "shops"
  add_foreign_key "information", "admins"
  add_foreign_key "menu_books", "shops"
  add_foreign_key "menus", "shops"
  add_foreign_key "prides", "shops"
  add_foreign_key "shop_events", "shops"
  add_foreign_key "shop_features", "features"
  add_foreign_key "shop_features", "shops"
  add_foreign_key "shop_recommends", "recommends"
  add_foreign_key "shop_recommends", "shops"
end
