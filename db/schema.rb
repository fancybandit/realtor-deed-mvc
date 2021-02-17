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

ActiveRecord::Schema.define(version: 2021_02_17_002043) do

  create_table "buildings", force: :cascade do |t|
    t.integer "year_built"
    t.float "price", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deeds", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "property_id"
    t.string "owner_name"
    t.date "date_signed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_deeds_on_owner_id"
    t.index ["property_id"], name: "index_deeds_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.float "price", default: 0.0
    t.integer "year_sold"
    t.float "acreage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_buildings", force: :cascade do |t|
    t.integer "property_id"
    t.integer "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_property_buildings_on_building_id"
    t.index ["property_id"], name: "index_property_buildings_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
