# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_05_211209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "descontos", force: :cascade do |t|
    t.bigint "produto_id", null: false
    t.string "nome"
    t.string "descricao"
    t.string "tipo"
    t.boolean "status", default: true
    t.decimal "preco"
    t.integer "leve"
    t.integer "pague"
    t.decimal "percentual_desconto"
    t.decimal "preco_de"
    t.decimal "preco_por"
    t.date "ativacao"
    t.date "inativacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_descontos_on_produto_id"
  end

  create_table "lojas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto"
  end

  add_foreign_key "descontos", "produtos"
end
