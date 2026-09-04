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

ActiveRecord::Schema[8.1].define(version: 2026_09_01_133742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "drugstore_stocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "drugstore_id", null: false
    t.string "medicine"
    t.decimal "price"
    t.integer "stock"
    t.datetime "updated_at", null: false
    t.index ["drugstore_id"], name: "index_drugstore_stocks_on_drugstore_id"
  end

  create_table "drugstores", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "medicine"
    t.integer "order_id"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "drugstore_id", null: false
    t.string "recete_id"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["drugstore_id"], name: "index_orders_on_drugstore_id"
  end

  create_table "pharmacists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "drugstore_id", null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "phone"
    t.string "surname"
    t.datetime "updated_at", null: false
    t.index ["drugstore_id"], name: "index_pharmacists_on_drugstore_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "address", null: false
    t.string "city"
    t.datetime "created_at", null: false
    t.string "district"
    t.string "email", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "name", null: false
    t.string "neighborhood"
    t.string "password_digest"
    t.string "phone_no", null: false
    t.string "surname", null: false
    t.string "tc_no", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_no"], name: "index_users_on_phone_no", unique: true
    t.index ["tc_no"], name: "index_users_on_tc_no", unique: true
  end

  add_foreign_key "drugstore_stocks", "drugstores"
  add_foreign_key "orders", "drugstores"
  add_foreign_key "pharmacists", "drugstores"
end
