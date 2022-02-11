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

ActiveRecord::Schema.define(version: 2022_02_11_015630) do

  create_table "feedbacks", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 191, collation: "utf8mb4_unicode_ci"
    t.string "email", limit: 191, collation: "utf8mb4_unicode_ci"
    t.string "role", limit: 191, collation: "utf8mb4_unicode_ci"
    t.text "feedback", size: :medium, collation: "utf8mb4_unicode_ci"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mobility_string_translations", charset: "utf8mb4", force: :cascade do |t|
    t.string "locale", limit: 191, null: false, collation: "utf8mb4_unicode_ci"
    t.string "key", limit: 191, null: false, collation: "utf8mb4_unicode_ci"
    t.string "value", limit: 191, collation: "utf8mb4_unicode_ci"
    t.string "translatable_type", limit: 191, collation: "utf8mb4_unicode_ci"
    t.bigint "translatable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_string_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_string_translations_on_keys", unique: true
    t.index ["translatable_type", "key", "value", "locale"], name: "index_mobility_string_translations_on_query_keys"
  end

  create_table "mobility_text_translations", charset: "utf8mb4", force: :cascade do |t|
    t.string "locale", limit: 191, null: false, collation: "utf8mb4_unicode_ci"
    t.string "key", limit: 191, null: false, collation: "utf8mb4_unicode_ci"
    t.text "value", collation: "utf8mb4_unicode_ci"
    t.string "translatable_type", limit: 191, collation: "utf8mb4_unicode_ci"
    t.bigint "translatable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_text_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_text_translations_on_keys", unique: true
  end

end
