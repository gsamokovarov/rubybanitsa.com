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

ActiveRecord::Schema.define(version: 2018_03_01_171925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: :bigint, default: -> { "nextval('event_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "time"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  create_table "locations", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "venue_id"
  end

  create_table "speakers", id: :bigint, default: -> { "nextval('speaker_id_seq'::regclass)" }, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "github_url", default: ""
    t.text "twitter_url", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers_talks", id: false, force: :cascade do |t|
    t.bigint "speaker_id"
    t.bigint "talk_id"
  end

  create_table "talks", id: :bigint, default: -> { "nextval('talk_id_seq'::regclass)" }, force: :cascade do |t|
    t.text "description"
    t.text "url", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "title", default: "Unknown"
    t.bigint "event_id"
    t.index ["event_id"], name: "idx_1630321_index_talks_on_event_id"
  end

  create_table "venues", id: :bigint, default: -> { "nextval('venue_id_seq'::regclass)" }, force: :cascade do |t|
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "name", default: ""
    t.text "place_id", default: ""
  end

end
