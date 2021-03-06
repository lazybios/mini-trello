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

ActiveRecord::Schema.define(version: 20151028130817) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "action",         limit: 255
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "permission",  limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_delete",                 default: false
    t.integer  "user_id",     limit: 4
  end

  create_table "cards", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "position",    limit: 4
    t.text     "description", limit: 65535
    t.datetime "due_date"
    t.integer  "user_id",     limit: 4
    t.integer  "list_id",     limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_delete",                 default: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "card_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "is_delete",                default: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "position",   limit: 4,   default: 0
    t.integer  "board_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_delete",              default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.string   "avator",          limit: 255, default: "https://unsplash.it/48/48/?random"
    t.string   "token",           limit: 255
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
  end

end
