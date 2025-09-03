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

ActiveRecord::Schema[7.1].define(version: 2025_09_03_131237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ai_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ai_chats_on_user_id"
  end

  create_table "ai_messages", force: :cascade do |t|
    t.string "role"
    t.text "content"
    t.bigint "ai_chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ai_chat_id"], name: "index_ai_messages_on_ai_chat_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "favorite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_id"], name: "index_chats_on_favorite_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.date "birthday"
    t.integer "age"
    t.string "gender"
    t.boolean "neutered"
    t.string "breed_grade"
    t.string "breed_category"
    t.string "main_breed"
    t.text "breed_mix"
    t.integer "shoulder_height"
    t.float "weight"
    t.date "in_shelter_since"
    t.string "location"
    t.boolean "chipped"
    t.boolean "health_issus"
    t.text "health_issus_details"
    t.boolean "list_dog"
    t.boolean "beginner_friendly"
    t.string "male_compatible"
    t.string "female_compatible"
    t.string "cat_compatible"
    t.string "kids_compatible"
    t.string "ideal_evironment"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_favorites_on_dog_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "role"
    t.text "content"
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "age_min"
    t.string "gender"
    t.boolean "neutered"
    t.string "breed_grade", default: [], array: true
    t.string "breed_category", default: [], array: true
    t.string "main_breed"
    t.integer "shoulder_height_min"
    t.float "weight_min"
    t.string "location", default: [], array: true
    t.boolean "health_issus"
    t.boolean "list_dog"
    t.boolean "beginner_friendly"
    t.string "male_compatible"
    t.string "female_compatible"
    t.string "cat_compatible"
    t.string "kids_compatible"
    t.string "ideal_evironment", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age_max"
    t.integer "shoulder_height_max"
    t.float "weight_max"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "username"
    t.string "name"
    t.string "shelter_type"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ai_chats", "users"
  add_foreign_key "ai_messages", "ai_chats"
  add_foreign_key "chats", "favorites"
  add_foreign_key "dogs", "users"
  add_foreign_key "favorites", "dogs"
  add_foreign_key "favorites", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "preferences", "users"
end
