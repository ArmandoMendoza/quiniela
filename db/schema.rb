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

ActiveRecord::Schema.define(version: 20180628210210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer_one"
    t.string   "answer_two"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["pool_id"], name: "index_answers_on_pool_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "bets", force: :cascade do |t|
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
    t.integer  "pos"
  end

  add_index "bets", ["match_id"], name: "index_bets_on_match_id", using: :btree
  add_index "bets", ["pool_id"], name: "index_bets_on_pool_id", using: :btree
  add_index "bets", ["user_id"], name: "index_bets_on_user_id", using: :btree

  create_table "elimination_bets", force: :cascade do |t|
    t.integer  "local"
    t.integer  "visitor"
    t.string   "local_name"
    t.string   "visitor_name"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.integer  "elimination_match_id"
    t.boolean  "completed",            default: false
    t.integer  "points",               default: 0
    t.integer  "pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elimination_matches", force: :cascade do |t|
    t.date     "date"
    t.string   "hour"
    t.string   "stadium"
    t.integer  "local_team_id"
    t.integer  "visitor_team_id"
    t.integer  "visitor"
    t.integer  "local"
    t.string   "match_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "match_to_winner"
    t.string   "select"
    t.string   "round"
    t.integer  "match_to_loser"
  end

  create_table "elimination_matches_pools", id: false, force: :cascade do |t|
    t.integer "elimination_match_id", null: false
    t.integer "pool_id",              null: false
  end

  add_index "elimination_matches_pools", ["elimination_match_id", "pool_id"], name: "elimination_pool_index", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",      default: "#FFF"
  end

  create_table "matches", force: :cascade do |t|
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
  add_index "matches", ["local_team_id"], name: "index_matches_on_local_team_id", using: :btree
  add_index "matches", ["visitor_team_id"], name: "index_matches_on_visitor_team_id", using: :btree

  create_table "matches_pools", id: false, force: :cascade do |t|
    t.integer "match_id", null: false
    t.integer "pool_id",  null: false
  end

  add_index "matches_pools", ["match_id", "pool_id"], name: "index_matches_pools_on_match_id_and_pool_id", using: :btree

  create_table "pools", force: :cascade do |t|
    t.string   "name"
    t.date     "end_date"
    t.boolean  "completed",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.float    "pot_percentage"
    t.boolean  "active_clasification", default: false
    t.boolean  "active_elimination",   default: false
    t.boolean  "show_all_bets",        default: true
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "last_name"
    t.string   "status"
  end

  add_index "registrations", ["pool_id"], name: "index_registrations_on_pool_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "local"
    t.integer  "visitor"
    t.string   "match_time"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "pos"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["group_id"], name: "index_teams_on_group_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "last_name"
    t.string   "nickname"
    t.integer  "bonus_points",        default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
