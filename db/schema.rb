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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130228070857) do

  create_table "battingperformances", :force => true do |t|
    t.integer  "matchdetail_id"
    t.integer  "batsman_id"
    t.integer  "bat_order"
    t.string   "score_seq"
    t.integer  "runs"
    t.integer  "wicketmode_id"
    t.integer  "bowler_id"
    t.integer  "fielder_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "battingperformances", ["matchdetail_id"], :name => "index_battingperformances_on_matchdetail_id"
  add_index "battingperformances", ["wicketmode_id"], :name => "index_battingperformances_on_wicketmode_id"

  create_table "bowlingperformances", :force => true do |t|
    t.integer  "matchdetail_id"
    t.integer  "bowler_id"
    t.integer  "over_no"
    t.string   "bowl_seq"
    t.integer  "conceded"
    t.integer  "wickets"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "bowlingperformances", ["matchdetail_id"], :name => "index_bowlingperformances_on_matchdetail_id"

  create_table "matchdetails", :force => true do |t|
    t.integer  "match_id"
    t.integer  "bat_team_id"
    t.integer  "bowl_team_id"
    t.integer  "score"
    t.integer  "wickets"
    t.integer  "overs"
    t.integer  "innings"
    t.integer  "extras"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "matchdetails", ["match_id"], :name => "index_matchdetails_on_match_id"

  create_table "matches", :force => true do |t|
    t.datetime "match_date"
    t.integer  "team_one_id"
    t.integer  "team_two_id"
    t.integer  "team_won_id"
    t.integer  "season_id"
    t.integer  "mom_id"
    t.integer  "toss_won_id"
    t.string   "tossselection_id"
    t.string   "status"
    t.string   "remarks"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "matches", ["season_id"], :name => "index_matches_on_season_id"

  create_table "matchplayers", :force => true do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "matchplayers", ["match_id"], :name => "index_matchplayers_on_match_id"
  add_index "matchplayers", ["player_id"], :name => "index_matchplayers_on_player_id"
  add_index "matchplayers", ["team_id"], :name => "index_matchplayers_on_team_id"

  create_table "playerbonds", :force => true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "season_id"
    t.string   "auction_price"
    t.string   "grade"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "playerbonds", ["player_id"], :name => "index_playerbonds_on_player_id"
  add_index "playerbonds", ["season_id"], :name => "index_playerbonds_on_season_id"
  add_index "playerbonds", ["team_id"], :name => "index_playerbonds_on_team_id"

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "nick_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seasons", :force => true do |t|
    t.date     "from"
    t.date     "to"
    t.integer  "winner_id"
    t.integer  "mos_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tossselections", :force => true do |t|
    t.string   "option"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wicketmodes", :force => true do |t|
    t.string   "mode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
