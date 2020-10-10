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

ActiveRecord::Schema.define(version: 2020_09_22_080904) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name_kanji", default: "", null: false
    t.string "first_name_kanji", default: "", null: false
    t.string "family_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "post_number", default: "", null: false
    t.integer "prefecture_id", null: false
    t.string "city", default: "", null: false
    t.string "block_number", default: "", null: false
    t.string "apartment_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "src"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", default: "", null: false
    t.bigint "buyer_id"
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "category", default: "", null: false
    t.string "brand"
    t.string "condition", default: "", null: false
    t.integer "shipment_fee_id", default: 0, null: false
    t.integer "shipment_region_id", default: 0, null: false
    t.integer "shipment_schedule_id", default: 0, null: false
    t.string "price", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "family_name_kanji", default: "", null: false
    t.string "first_name_kanji", default: "", null: false
    t.string "family_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "images", "items"
  add_foreign_key "items", "users", column: "buyer_id"
end
