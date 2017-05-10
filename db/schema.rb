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

ActiveRecord::Schema.define(version: 20170509235504) do

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["response_id"], name: "index_locations_on_response_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "version"
    t.integer  "offset"
    t.string   "suffix"
    t.string   "localtime"
    t.string   "isotime"
    t.string   "utctime"
    t.string   "dst"
    t.integer  "time_request_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "responses", ["time_request_id"], name: "index_responses_on_time_request_id"

  create_table "time_requests", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "current_time"
    t.string   "request_session"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
