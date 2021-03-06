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

ActiveRecord::Schema.define(version: 2019_02_02_090648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_assignments_on_box_id"
    t.index ["player_id"], name: "index_assignments_on_player_id"
  end

  create_table "boxes", force: :cascade do |t|
    t.bigint "round_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_boxes_on_round_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.string "phone"
    t.string "password_digest"
    t.boolean "active", default: true
    t.string "preferred_contact", default: ""
    t.string "notes", default: ""
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["first_name", "email"], name: "index_players_on_first_name_and_email"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["start_time"], name: "index_rounds_on_start_time"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_venues_on_name"
  end

  add_foreign_key "assignments", "boxes"
  add_foreign_key "assignments", "players"
  add_foreign_key "boxes", "rounds"
end
