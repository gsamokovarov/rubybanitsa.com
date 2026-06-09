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

ActiveRecord::Schema[7.1].define(version: 2026_06_02_120000) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.string "description", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "published_at", precision: nil
    t.string "meetup_url", default: "", null: false
    t.string "facebook_url", default: "", null: false
    t.datetime "meetup_published_at", precision: nil
    t.string "online_url", default: ""
    t.string "name"
    t.integer "venue_id", null: false
    t.boolean "vibe", default: false, null: false
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "publish_at", precision: nil
    t.datetime "expires_at", precision: nil
    t.integer "company_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "application_url", default: "", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "github_url", default: "", null: false
    t.string "twitter_url", default: "", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "speakers_talks", id: false, force: :cascade do |t|
    t.integer "speaker_id", null: false
    t.integer "talk_id", null: false
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_sponsorships_on_company_id"
    t.index ["event_id"], name: "index_sponsorships_on_event_id"
  end

  create_table "talks", force: :cascade do |t|
    t.string "description", null: false
    t.string "url", default: "", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title", default: "Unknown", null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_talks_on_event_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "address", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name", default: "", null: false
    t.string "place_id", default: "", null: false
    t.string "directions", default: "", null: false
    t.boolean "online", default: false
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contacts", "companies"
  add_foreign_key "events", "venues"
  add_foreign_key "jobs", "companies"
  add_foreign_key "sponsorships", "companies"
  add_foreign_key "sponsorships", "events"
  add_foreign_key "talks", "events"
end
