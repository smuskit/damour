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

ActiveRecord::Schema.define(version: 2019_02_14_054944) do

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
  end

  create_table "cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "region_id"
    t.integer "prefecture_id"
    t.string "dam_name"
    t.date "visit_date"
    t.integer "version_bf"
    t.integer "version_af"
    t.integer "version_y"
    t.integer "version_m"
    t.string "card_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dam_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dam_id"
    t.text "title"
    t.text "comment"
    t.string "comment_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dams", force: :cascade do |t|
    t.integer "region_id"
    t.integer "prefecture_id"
    t.string "name"
    t.string "name_kana"
    t.string "address"
    t.string "river"
    t.integer "dam_type", limit: 1, default: 0, null: false
    t.string "gate"
    t.float "height"
    t.float "length"
    t.float "volume"
    t.text "purpose"
    t.text "constructor"
    t.text "start_of_construction"
    t.text "end_of_construction"
    t.string "dam_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "postal_code"
  end

  create_table "distributes", force: :cascade do |t|
    t.text "dam_id"
    t.text "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.text "name"
    t.text "name_kana"
    t.string "address"
    t.time "opening_hours"
    t.time "closing_hours"
    t.text "holiday"
    t.text "business_period"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "card_id"
    t.string "dam_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "region_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "name_kana"
    t.string "hundle_name"
    t.text "profile_image_id"
    t.boolean "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
