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

ActiveRecord::Schema.define(:version => 20130730040000) do

  create_table "candidates", :force => true do |t|
    t.integer  "election_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.string   "rank"
    t.string   "phone_home"
    t.string   "phone_mobile"
    t.date     "dob"
    t.string   "bsa_id"
    t.string   "email_scout"
    t.string   "email_parent"
    t.boolean  "elected"
    t.date     "ordeal_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "division_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "elections", :force => true do |t|
    t.string   "unit_type"
    t.string   "unit_number"
    t.datetime "held_at"
    t.string   "location"
    t.integer  "num_scouts_active"
    t.integer  "num_scouts_present"
    t.integer  "num_scouts_eligible"
    t.integer  "ballot_one_count"
    t.integer  "ballot_two_count"
    t.boolean  "no_candidates"
    t.boolean  "election_refused"
    t.boolean  "camp_promotion"
    t.boolean  "camp_promotion_refused"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "token"
    t.integer  "district_id"
    t.string   "coordinator_name"
    t.string   "coordinator_email"
    t.string   "coordinator_phone"
    t.integer  "team_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "lodge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "email"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
  end

end
