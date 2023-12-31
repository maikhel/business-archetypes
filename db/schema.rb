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

ActiveRecord::Schema[7.1].define(version: 2023_11_15_195415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "party_relationships", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "supplier_type"
    t.bigint "supplier_id"
    t.string "client_type"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_type", "client_id"], name: "index_party_relationships_on_client"
    t.index ["supplier_type", "supplier_id"], name: "index_party_relationships_on_supplier"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "party_type"
    t.bigint "party_id"
    t.index ["party_type", "party_id"], name: "index_roles_on_party"
  end

end
