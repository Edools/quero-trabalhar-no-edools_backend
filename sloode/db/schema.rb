# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161101024505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "unaccent"

  create_table "courses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.uuid     "school_id"
    t.text     "description"
    t.text     "content"
    t.integer  "duration"
    t.date     "creation_date"
    t.integer  "active_students"
    t.decimal  "price",           precision: 8, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree
  add_index "courses", ["title"], name: "index_courses_on_title", using: :btree

  create_table "schools", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",          default: ""
    t.string   "email",         default: ""
    t.string   "pitch",                      null: false
    t.string   "subdomain",                  null: false
    t.date     "creation_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree

  add_foreign_key "courses", "schools"
end
