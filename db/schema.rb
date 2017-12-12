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

ActiveRecord::Schema.define(version: 20171212050828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string "date"
    t.string "weighIn"
    t.string "caloricGoal"
    t.string "fatGoal"
    t.string "carbGoal"
    t.string "proteinGoal"
    t.string "actualCalories"
    t.string "actualFat"
    t.string "actualCarb"
    t.string "actualProtein"
    t.string "progress"
    t.string "day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "gender"
    t.integer "age"
    t.integer "weight"
    t.decimal "height"
    t.string "activty_level"
    t.integer "goal"
    t.string "length"
    t.integer "deadlift"
    t.integer "squat"
    t.integer "overhead_press"
    t.integer "bench_press"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "activity"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "confirm_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "users"
  add_foreign_key "profiles", "users"
end
