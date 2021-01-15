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

ActiveRecord::Schema.define(version: 2021_01_15_102140) do

  create_table "happiness", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_happiness_on_user_id"
  end

  create_table "social_auths", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider", limit: 32, null: false
    t.string "uid", limit: 191, null: false
    t.string "access_token", null: false
    t.string "secret", null: false
    t.json "extra_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_social_auths_on_provider_and_uid", unique: true
    t.index ["user_id"], name: "index_social_auths_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "screen_name", null: false
    t.string "name", null: false
    t.string "profile_image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["screen_name"], name: "index_users_on_screen_name", unique: true
  end

  add_foreign_key "happiness", "users", on_delete: :cascade
  add_foreign_key "social_auths", "users", on_delete: :cascade
end
