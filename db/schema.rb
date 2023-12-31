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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_210457) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blip_activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "blip_id", null: false
    t.integer "stage"
    t.integer "event"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blip_id"], name: "index_blip_activities_on_blip_id"
    t.index ["team_id"], name: "index_blip_activities_on_team_id"
    t.index ["user_id"], name: "index_blip_activities_on_user_id"
  end

  create_table "blips", force: :cascade do |t|
    t.bigint "interesting_thing_id", null: false
    t.bigint "team_id", null: false
    t.integer "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "radial_noise"
    t.float "angular_noise"
    t.integer "position"
    t.index ["interesting_thing_id"], name: "index_blips_on_interesting_thing_id"
    t.index ["team_id"], name: "index_blips_on_team_id"
  end

  create_table "interesting_things", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "kind"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "position"
    t.index ["team_id"], name: "index_interesting_things_on_team_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_community"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "nickname"
    t.string "profile_url"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blip_activities", "blips"
  add_foreign_key "blip_activities", "teams"
  add_foreign_key "blip_activities", "users"
  add_foreign_key "blips", "interesting_things"
  add_foreign_key "blips", "teams"
  add_foreign_key "interesting_things", "teams"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
end
