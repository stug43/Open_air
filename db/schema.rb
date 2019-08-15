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

ActiveRecord::Schema.define(version: 2019_08_15_094230) do

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

  create_table "dataset_collections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_dataset_collections_on_dataset_id"
    t.index ["user_id"], name: "index_dataset_collections_on_user_id"
  end

  create_table "datasets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "db_link"
    t.string "dpsir_category"
    t.text "description"
    t.boolean "rendered"
    t.string "file_type"
  end

  create_table "departments", force: :cascade do |t|
    t.string "dpt_name"
    t.string "dpt_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "pollutant_id"
    t.string "value"
    t.string "measurement_periodicity"
    t.datetime "measurement_start_date"
    t.datetime "measurement_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "datasud_measurement_fid_code"
    t.index ["pollutant_id"], name: "index_measurements_on_pollutant_id"
    t.index ["station_id"], name: "index_measurements_on_station_id"
  end

  create_table "pollutants", force: :cascade do |t|
    t.string "pollutant_name"
    t.string "datasud_pollutant_id"
    t.string "measurement_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.bigint "township_id"
    t.string "station_name"
    t.string "station_code"
    t.string "typology"
    t.string "influence"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["township_id"], name: "index_stations_on_township_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "driver_section_title"
    t.text "driver_section_intro"
    t.string "pressure_section_title"
    t.text "pressure_section_intro"
    t.string "state_section_title"
    t.text "state_section_intro"
    t.string "impact_section_title"
    t.text "impact_section_intro"
    t.string "response_section_title"
    t.text "response_section_intro"
  end

  create_table "topics_and_datasets_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id"
    t.bigint "dataset_id"
    t.index ["dataset_id"], name: "index_topics_and_datasets_links_on_dataset_id"
    t.index ["topic_id"], name: "index_topics_and_datasets_links_on_topic_id"
  end

  create_table "townships", force: :cascade do |t|
    t.bigint "department_id"
    t.string "township_name"
    t.string "insee_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_townships_on_department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.string "provider"
    t.string "uid"
    t.string "rake"
    t.boolean "admin?", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
