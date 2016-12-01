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

ActiveRecord::Schema.define(version: 20161201230635) do

  create_table "bulletin_boards", force: :cascade do |t|
    t.integer  "num_posts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
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
    t.date     "create_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "bulletin_board_id"
  end

  add_index "groups", ["bulletin_board_id"], name: "index_groups_on_bulletin_board_id"

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id"
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id"

  create_table "typeios", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "bulletin_board_id"
    t.string   "subject"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.boolean  "ispriority",         default: false
  end

  add_index "typeios", ["bulletin_board_id"], name: "index_typeios_on_bulletin_board_id"
  add_index "typeios", ["cached_votes_down"], name: "index_typeios_on_cached_votes_down"
  add_index "typeios", ["cached_votes_score"], name: "index_typeios_on_cached_votes_score"
  add_index "typeios", ["cached_votes_total"], name: "index_typeios_on_cached_votes_total"
  add_index "typeios", ["cached_votes_up"], name: "index_typeios_on_cached_votes_up"
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
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
