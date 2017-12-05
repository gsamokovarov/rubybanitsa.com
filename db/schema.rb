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

ActiveRecord::Schema.define(version: 2017_12_03_213932) do

  create_table "events", force: :cascade do |t|
    t.datetime "time", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "venue_id", null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "github_url", default: "", null: false
    t.string "twitter_url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speakers_talks", id: false, force: :cascade do |t|
    t.integer "speaker_id", null: false
    t.integer "talk_id", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string "description", null: false
    t.string "url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: "Unknown", null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_talks_on_event_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "place_id", default: "", null: false
  end

end
