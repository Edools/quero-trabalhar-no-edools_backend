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

ActiveRecord::Schema.define(version: 20160610052914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "curso_id",   null: false
    t.integer  "escola_id",  null: false
    t.boolean  "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alunos", ["curso_id"], name: "index_alunos_on_curso_id", using: :btree
  add_index "alunos", ["escola_id"], name: "index_alunos_on_escola_id", using: :btree

  create_table "cursos", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "escola_id",     null: false
    t.string   "descricao"
    t.string   "conteudo"
    t.integer  "duracao"
    t.datetime "data_criacao"
    t.integer  "alunos_ativos"
    t.float    "preco"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cursos", ["escola_id"], name: "index_cursos_on_escola_id", using: :btree

  create_table "escolas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "pitch"
    t.string   "subdominio"
    t.datetime "data_criacao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "alunos", "cursos"
  add_foreign_key "alunos", "escolas"
  add_foreign_key "cursos", "escolas"
end
