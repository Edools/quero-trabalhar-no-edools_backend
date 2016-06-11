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

ActiveRecord::Schema.define(version: 20160611005652) do

  create_table "course_students", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "course_students", ["course_id"], name: "index_course_students_on_course_id"
  add_index "course_students", ["student_id"], name: "index_course_students_on_student_id"

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "content"
    t.float    "duration"
    t.datetime "date_of_creation"
    t.float    "price"
    t.integer  "school_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pitch"
    t.string   "subdomain"
    t.datetime "date_of_creation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "enrollment"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
