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

ActiveRecord::Schema.define(version: 20171101045143) do

  create_table "borders", primary_key: ["country1", "country2"], force: :cascade do |t|
    t.string "country1", limit: 4, null: false
    t.string "country2", limit: 4, null: false
    t.decimal "length"
  end

  create_table "city", primary_key: ["name", "country", "province"], force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
    t.decimal "population"
    t.decimal "longitude"
    t.decimal "latitude"
    t.decimal "elevation"
  end

  create_table "continent", primary_key: "name", id: :string, limit: 20, force: :cascade do |t|
    t.integer "area", limit: 10, precision: 10
  end

  create_table "countries", primary_key: "name", id: :string, limit: 12, force: :cascade do |t|
    t.string "continent", limit: 6
    t.integer "area", limit: 8, precision: 8
    t.integer "population", limit: 10, precision: 10
    t.integer "gdp", limit: 7, precision: 7
  end

  create_table "country", primary_key: "code", id: :string, limit: 4, force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "capital", limit: 40
    t.string "province", limit: 40
    t.decimal "area"
    t.decimal "population"
    t.index ["name"], name: "sys_c00545504", unique: true
  end

# Could not dump table "desert" because of following StandardError
#   Unknown type 'AMLY.GEOCOORD' for column 'coordinates'

  create_table "drivers", force: :cascade do |t|
    t.integer "age", precision: 38
    t.string "race"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "economy", primary_key: "country", id: :string, limit: 4, force: :cascade do |t|
    t.decimal "gdp"
    t.decimal "agriculture"
    t.decimal "service"
    t.decimal "industry"
    t.decimal "inflation"
  end

  create_table "encompasses", primary_key: ["country", "continent"], force: :cascade do |t|
    t.string "country", limit: 4, null: false
    t.string "continent", limit: 20, null: false
    t.decimal "percentage"
  end

  create_table "ethnicgroup", primary_key: ["name", "country"], force: :cascade do |t|
    t.string "country", limit: 4, null: false
    t.string "name", limit: 50, null: false
    t.decimal "percentage"
  end

  create_table "geo_desert", primary_key: ["province", "country", "desert"], force: :cascade do |t|
    t.string "desert", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_estuary", primary_key: ["province", "country", "river"], force: :cascade do |t|
    t.string "river", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_island", primary_key: ["province", "country", "island"], force: :cascade do |t|
    t.string "island", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_lake", primary_key: ["province", "country", "lake"], force: :cascade do |t|
    t.string "lake", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_mountain", primary_key: ["province", "country", "mountain"], force: :cascade do |t|
    t.string "mountain", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_river", primary_key: ["province", "country", "river"], force: :cascade do |t|
    t.string "river", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_sea", primary_key: ["province", "country", "sea"], force: :cascade do |t|
    t.string "sea", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "geo_source", primary_key: ["province", "country", "river"], force: :cascade do |t|
    t.string "river", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "province", limit: 40, null: false
  end

  create_table "high_scores", force: :cascade do |t|
    t.string "game"
    t.integer "score", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

# Could not dump table "island" because of following StandardError
#   Unknown type 'AMLY.GEOCOORD' for column 'coordinates'

  create_table "islandin", id: false, force: :cascade do |t|
    t.string "island", limit: 40
    t.string "sea", limit: 40
    t.string "lake", limit: 40
    t.string "river", limit: 40
  end

  create_table "ismember", primary_key: ["country", "organization"], force: :cascade do |t|
    t.string "country", limit: 4, null: false
    t.string "organization", limit: 12, null: false
    t.string "type", limit: 40, default: "member"
  end

# Could not dump table "lake" because of following StandardError
#   Unknown type 'AMLY.GEOCOORD' for column 'coordinates'

  create_table "language", primary_key: ["name", "country"], force: :cascade do |t|
    t.string "country", limit: 4, null: false
    t.string "name", limit: 50, null: false
    t.decimal "percentage"
  end

  create_table "located", id: false, force: :cascade do |t|
    t.string "city", limit: 40
    t.string "province", limit: 40
    t.string "country", limit: 4
    t.string "river", limit: 40
    t.string "lake", limit: 40
    t.string "sea", limit: 40
  end

  create_table "locatedon", primary_key: ["city", "province", "country", "island"], force: :cascade do |t|
    t.string "city", limit: 40, null: false
    t.string "province", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.string "island", limit: 40, null: false
  end

  create_table "mergeswith", primary_key: ["sea1", "sea2"], force: :cascade do |t|
    t.string "sea1", limit: 40, null: false
    t.string "sea2", limit: 40, null: false
  end

# Could not dump table "mountain" because of following StandardError
#   Unknown type 'AMLY.GEOCOORD' for column 'coordinates'

  create_table "mountainonisland", primary_key: ["mountain", "island"], force: :cascade do |t|
    t.string "mountain", limit: 40, null: false
    t.string "island", limit: 40, null: false
  end

  create_table "organization", primary_key: "abbreviation", id: :string, limit: 12, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.string "city", limit: 40
    t.string "country", limit: 4
    t.string "province", limit: 40
    t.date "established"
    t.index ["name"], name: "orgnameunique", unique: true
  end

  create_table "police", force: :cascade do |t|
    t.integer "policeid", precision: 38
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "politics", primary_key: "country", id: :string, limit: 4, force: :cascade do |t|
    t.date "independence"
    t.string "wasdependent", limit: 40
    t.string "dependent", limit: 4
    t.string "government", limit: 120
  end

  create_table "population", primary_key: "country", id: :string, limit: 4, force: :cascade do |t|
    t.decimal "population_growth"
    t.decimal "infant_mortality"
  end

  create_table "province", primary_key: ["name", "country"], force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "country", limit: 4, null: false
    t.decimal "population"
    t.decimal "area"
    t.string "capital", limit: 40
    t.string "capprov", limit: 40
  end

  create_table "religion", primary_key: ["name", "country"], force: :cascade do |t|
    t.string "country", limit: 4, null: false
    t.string "name", limit: 50, null: false
    t.decimal "percentage"
  end

# Could not dump table "river" because of following StandardError
#   Unknown type 'AMLY.GEOCOORD' for column 'source'

  create_table "riverthrough", primary_key: ["river", "lake"], force: :cascade do |t|
    t.string "river", limit: 40, null: false
    t.string "lake", limit: 40, null: false
  end

  create_table "sea", primary_key: "name", id: :string, limit: 40, force: :cascade do |t|
    t.decimal "depth"
  end

end
