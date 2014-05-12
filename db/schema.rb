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

ActiveRecord::Schema.define(version: 20140509193227) do

  create_table "golfers", force: true do |t|
    t.string   "golfer_api_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.integer  "cuts_made"
    t.integer  "world_rank"
    t.integer  "first_place"
    t.integer  "second_place"
    t.integer  "third_place"
    t.integer  "top_10"
    t.integer  "top_25"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "golfers_teams", force: true do |t|
    t.integer "golfer_id"
    t.integer "team_id"
  end

  create_table "golfers_tournaments", force: true do |t|
    t.integer "golfer_id"
    t.integer "tournament_id"
    t.integer "golfer_tournament_points"
  end

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "tournament_name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "venue"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "tournament_api_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
