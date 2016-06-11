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

ActiveRecord::Schema.define(version: 20160611135116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "title",                                                     null: false
    t.integer  "school_id",                                                 null: false
    t.text     "description"
    t.text     "content"
    t.string   "duration"
    t.decimal  "price",                 precision: 8, scale: 2,             null: false
    t.integer  "total_active_students",                         default: 0
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "contact_email", null: false
    t.string   "pitch"
    t.string   "subdomain",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree
  add_index "schools", ["subdomain"], name: "index_schools_on_subdomain", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.date     "birthday",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["name"], name: "index_students_on_name", using: :btree

  add_foreign_key "courses", "schools"
end
