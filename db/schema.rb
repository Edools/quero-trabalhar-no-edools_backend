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

ActiveRecord::Schema.define(version: 20161105133915) do

  create_table "Alunos_Cursos", id: false, force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "curso_id", null: false
  end

  create_table "alunos", force: :cascade do |t|
    t.string   "nome"
    t.string   "matricula"
    t.integer  "status"
    t.integer  "curso_id"
    t.integer  "escola_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_alunos_on_curso_id"
    t.index ["escola_id"], name: "index_alunos_on_escola_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.text     "conteudo"
    t.integer  "duracao"
    t.date     "data"
    t.float    "preco"
    t.integer  "escola_id"
    t.integer  "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_cursos_on_aluno_id"
    t.index ["escola_id"], name: "index_cursos_on_escola_id"
  end

  create_table "escolas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "pitch"
    t.string   "subdominio"
    t.date     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
