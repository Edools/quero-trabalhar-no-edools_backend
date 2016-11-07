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

ActiveRecord::Schema.define(version: 20161107015640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     null: false
    t.string   "number"
    t.string   "district",   null: false
    t.integer  "city_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "state_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "abbr",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",       null: false
    t.integer  "school_id",   null: false
    t.string   "description", null: false
    t.text     "content",     null: false
    t.string   "duration",    null: false
    t.decimal  "price",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["school_id"], name: "index_courses_on_school_id", using: :btree
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "school_id",  null: false
    t.integer  "student_id", null: false
    t.integer  "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_enrollments_on_school_id", using: :btree
    t.index ["student_id"], name: "index_enrollments_on_student_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "owner_email", null: false
    t.string   "pitch"
    t.string   "subdomain"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "abbr",       null: false
    t.integer  "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "phone"
    t.string   "birthdate",  null: false
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_students_on_address_id", using: :btree
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "states"
  add_foreign_key "courses", "schools"
  add_foreign_key "enrollments", "schools"
  add_foreign_key "enrollments", "students"
  add_foreign_key "states", "countries"
  add_foreign_key "students", "addresses"
end
