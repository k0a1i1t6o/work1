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

ActiveRecord::Schema.define(version: 20190208065041) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "goalpost_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goalposts", force: :cascade do |t|
    t.text "from"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "to"
    t.text "goal"
    t.text "comment"
    t.integer "likes_count", default: 0
    t.text "reward"
    t.index ["user_id", "created_at"], name: "index_goalposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_goalposts_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "goalpost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goalpost_id"], name: "index_likes_on_goalpost_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "picture"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
