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

ActiveRecord::Schema.define(version: 2019_04_30_044100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer "duration"
    t.string "note"
    t.datetime "start_time"
    t.datetime "date"
    t.string "location"
    t.boolean "is_scheduled"
    t.string "comment"
    t.integer "rating"
    t.bigint "walker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["walker_id"], name: "index_appointments_on_walker_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "breed"
    t.string "size"
    t.string "description"
    t.integer "age"
    t.string "name"
    t.string "pic"
    t.string "gender"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "dogs_appointments", id: false, force: :cascade do |t|
    t.bigint "dog_id"
    t.bigint "appointment_id"
    t.index ["appointment_id"], name: "index_dogs_appointments_on_appointment_id"
    t.index ["dog_id"], name: "index_dogs_appointments_on_dog_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackings", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walkers", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.string "phone"
    t.string "zip_code"
    t.integer "avg_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "walkers"
  add_foreign_key "dogs", "owners"
end
