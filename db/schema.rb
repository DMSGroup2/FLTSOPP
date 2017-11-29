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

ActiveRecord::Schema.define(version: 0) do

  create_table "driver", primary_key: "violation_id", id: :string, limit: 14, force: :cascade do |t|
    t.string "is_out_of_state", limit: 5
    t.string "driver_race", limit: 10
    t.integer "driver_age", limit: 3, precision: 3
    t.string "driver_gender", limit: 1
  end

  create_table "drivers", force: :cascade do |t|
    t.integer "age", precision: 38
    t.string "race"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gives", primary_key: ["violation_id", "officer_id"], force: :cascade do |t|
    t.string "officer_id", limit: 5, null: false
    t.string "violation_id", limit: 14, null: false
  end

  create_table "located_at", primary_key: ["violation_id", "stop_time"], force: :cascade do |t|
    t.string "stop_date", limit: 8, null: false
    t.string "stop_time", limit: 5, null: false
    t.integer "county_fips", limit: 5, precision: 5, null: false
    t.string "driver_gender", limit: 1
    t.string "driver_race", limit: 10
    t.integer "driver_age", limit: 3, precision: 3
    t.string "officer_id", limit: 5, null: false
    t.string "violation_id", limit: 14, null: false
  end

  create_table "location", primary_key: ["stop_date", "stop_time", "county_fips"], force: :cascade do |t|
    t.string "stop_date", limit: 8, null: false
    t.string "stop_time", limit: 5, null: false
    t.integer "county_fips", limit: 5, precision: 5, null: false
    t.string "county_name", limit: 20
  end

  create_table "officer", primary_key: "officer_id", id: :string, limit: 5, force: :cascade do |t|
    t.string "officer_gender", limit: 1
    t.integer "officer_age", limit: 3, precision: 3
    t.string "officer_race", limit: 10
    t.string "officer_rank", limit: 12
  end

  create_table "stops", primary_key: "violation_id", id: :string, limit: 14, force: :cascade do |t|
    t.string "officer_id", limit: 5, null: false
    t.string "driver_gender", limit: 1
    t.string "driver_race", limit: 10
    t.integer "driver_age", limit: 3, precision: 3
  end

  create_table "violation", primary_key: "violation_id", id: :string, limit: 14, force: :cascade do |t|
    t.string "violation_type", limit: 100
    t.string "stop_outcome", limit: 30
    t.string "is_arrested", limit: 6
  end

  add_foreign_key "driver", "violation", primary_key: "violation_id", name: "sys_c00548566"
end
