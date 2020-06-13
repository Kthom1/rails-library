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

ActiveRecord::Schema.define(version: 2020_06_13_195038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "checked_out"
    t.boolean "reserved"
    t.string "categories", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkout_records", force: :cascade do |t|
    t.datetime "checkout_date"
    t.datetime "supposed_return_date"
    t.datetime "actual_return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "staff_id"
    t.bigint "member_id"
    t.index ["member_id"], name: "index_checkout_records_on_member_id"
    t.index ["staff_id"], name: "index_checkout_records_on_staff_id"
  end

  create_table "reserve_records", force: :cascade do |t|
    t.datetime "valid_until_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "staff_id"
    t.bigint "member_id"
    t.index ["member_id"], name: "index_reserve_records_on_member_id"
    t.index ["staff_id"], name: "index_reserve_records_on_staff_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.bigint "checkout_ids", default: [], array: true
    t.bigint "reserve_ids", default: [], array: true
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checkout_records", "users", column: "member_id"
  add_foreign_key "checkout_records", "users", column: "staff_id"
  add_foreign_key "reserve_records", "users", column: "member_id"
  add_foreign_key "reserve_records", "users", column: "staff_id"
end
