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

ActiveRecord::Schema.define(version: 20140516024147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "answer_one"
    t.string   "answer_two"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["pool_id"], name: "index_answers_on_pool_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "bets", force: true do |t|
    t.integer  "local"
    t.integer  "visitor"
    t.string   "match_time"
    t.boolean  "completed",  default: false
    t.integer  "user_id"
    t.integer  "pool_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",     default: 0
  end

  add_index "bets", ["match_id"], name: "index_bets_on_match_id", using: :btree
  add_index "bets", ["pool_id"], name: "index_bets_on_pool_id", using: :btree
  add_index "bets", ["user_id"], name: "index_bets_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.date     "date"
    t.string   "stadium"
    t.integer  "local_team_id"
    t.integer  "visitor_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "match_number"
    t.string   "hour"
  end

  add_index "matches", ["group_id"], name: "index_matches_on_group_id", using: :btree

  create_table "matches_pools", id: false, force: true do |t|
    t.integer "match_id", null: false
    t.integer "pool_id",  null: false
  end

  add_index "matches_pools", ["match_id", "pool_id"], name: "index_matches_pools_on_match_id_and_pool_id", using: :btree

  create_table "pools", force: true do |t|
    t.string   "name"
    t.date     "end_date"
    t.boolean  "completed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "scores", force: true do |t|
    t.integer  "local"
    t.integer  "visitor"
    t.string   "match_time"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "pos"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["group_id"], name: "index_teams_on_group_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "role"
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
