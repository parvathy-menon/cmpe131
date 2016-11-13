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

ActiveRecord::Schema.define(version: 20161113200016) do

  create_table "bulletin_boards", force: :cascade do |t|
    t.integer  "num_posts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "likes"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "typeio_id"
    t.integer  "user_id"
  end

  add_index "comments", ["typeio_id"], name: "index_comments_on_typeio_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "created_by"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "bulletin_board_id"
  end

  add_index "groups", ["bulletin_board_id"], name: "index_groups_on_bulletin_board_id"

  create_table "typeios", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "typeios", ["user_id"], name: "index_typeios_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "bulletin_board_id"
  end

  add_index "users", ["bulletin_board_id"], name: "index_users_on_bulletin_board_id"

end
