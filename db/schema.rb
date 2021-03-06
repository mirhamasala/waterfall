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

ActiveRecord::Schema.define(version: 20180307111314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.string "title", default: "Chart Title"
    t.string "subtitle", default: "chart subtitle"
    t.text "notes"
    t.integer "font_size", default: 12
    t.string "color", default: "green"
    t.string "chart_image", default: "http://res.cloudinary.com/arnauddlc/image/upload/v1519980141/waterfall.png"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chart_type"
    t.index ["user_id"], name: "index_charts_on_user_id"
  end

  create_table "datasets", force: :cascade do |t|
    t.string "label"
    t.integer "value", default: 0
    t.bigint "chart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serietype", default: "baseline"
    t.integer "offset", default: 0
    t.string "value_user", default: "e"
    t.index ["chart_id"], name: "index_datasets_on_chart_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "charts", "users"
  add_foreign_key "datasets", "charts"
end
