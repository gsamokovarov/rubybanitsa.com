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

ActiveRecord::Schema.define(version: 2018_05_14_122219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: :bigint, default: -> { "nextval('event_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "time", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.string "meetup_url", default: "", null: false
    t.string "facebook_url", default: "", null: false
  end

  create_table "locations", id: :bigint, default: -> { "nextval('location_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "venue_id", null: false
  end

  create_table "speakers", id: :bigint, default: -> { "nextval('speaker_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "github_url", default: "", null: false
    t.string "twitter_url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speakers_talks", id: false, force: :cascade do |t|
    t.bigint "speaker_id", null: false
    t.bigint "talk_id", null: false
  end

  create_table "talks", id: :bigint, default: -> { "nextval('talk_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "description", null: false
    t.string "url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: "Unknown", null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_talks_on_event_id"
  end

  create_table "venues", id: :bigint, default: -> { "nextval('venue_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "place_id", default: "", null: false
  end

  add_foreign_key "talks", "events"
end
