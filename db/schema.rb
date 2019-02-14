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

ActiveRecord::Schema.define(version: 2019_02_14_075909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "time"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string "meetup_url", default: "", null: false
    t.string "facebook_url", default: "", null: false
    t.datetime "meetup_published_at"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "publish_at"
    t.datetime "expires_at"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "application_url", default: "", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "venue_id"
  end

  create_table "speakers", force: :cascade do |t|
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

  create_table "talks", force: :cascade do |t|
    t.text "description"
    t.text "url", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "title", default: "Unknown"
    t.bigint "event_id"
    t.index ["event_id"], name: "idx_1630253_index_talks_on_event_id"
  end

  create_table "venues", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "name", default: ""
    t.text "place_id", default: ""
    t.string "directions", default: "", null: false
  end

  add_foreign_key "contacts", "companies"
  add_foreign_key "jobs", "companies"
end
