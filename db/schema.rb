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

ActiveRecord::Schema[8.1].define(version: 2026_08_19_070811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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
end
