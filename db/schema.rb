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

ActiveRecord::Schema.define(version: 20160605185156) do

  create_table "alunos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "escola_id"
    t.text     "descricao"
    t.text     "conteudo"
    t.string   "duracao"
    t.datetime "data_criacao"
    t.integer  "alunos_ativos_id"
    t.float    "preco"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cursos", ["alunos_ativos_id"], name: "index_cursos_on_alunos_ativos_id"
  add_index "cursos", ["escola_id"], name: "index_cursos_on_escola_id"

  create_table "escolas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email_dono"
    t.text     "pitch"
    t.string   "sub_dominio"
    t.date     "data_criacao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
