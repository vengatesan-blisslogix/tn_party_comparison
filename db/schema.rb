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

ActiveRecord::Schema.define(version: 20160325122824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer  "district_list_id"
    t.text     "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "party_list_id"
    t.text     "name"
    t.text     "image"
    t.text     "x1"
    t.text     "x2"
    t.text     "x3"
    t.text     "x4"
    t.text     "x5"
    t.text     "x6"
    t.text     "x7"
    t.text     "x8"
    t.text     "x9"
    t.text     "x10"
    t.text     "x11"
    t.text     "x12"
    t.text     "x13"
    t.text     "x14"
    t.text     "x15"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "district_list_id"
    t.text     "desc"
    t.integer  "cm_candidate"
  end

  create_table "district_lists", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "party_lists", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.text     "comments"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "leading_count",       limit: 8
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "ip_address"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "area_id"
    t.integer  "party_list_id"
    t.integer  "leading_count", limit: 8
  end

end
