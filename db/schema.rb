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

ActiveRecord::Schema.define(version: 20170518051810) do

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "upload_id",  limit: 4
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.integer  "subconti_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "countries", ["subconti_id"], name: "index_countries_on_subconti_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image",       limit: 255
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "upload_id",  limit: 4
  end

  create_table "maps", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "resolutions",     limit: 255
    t.string   "regions",         limit: 255
    t.string   "regions_name",    limit: 255
    t.string   "infomation",      limit: 255
    t.string   "pre_resolutions", limit: 255
  end

  create_table "searches", force: :cascade do |t|
    t.string   "upload_id",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "country_name",  limit: 255
    t.string   "city_name",     limit: 255
    t.string   "conti_name",    limit: 255
    t.string   "subconti_name", limit: 255
    t.string   "country",       limit: 255
    t.string   "city",          limit: 255
    t.string   "continent",     limit: 255
    t.string   "subcontinent",  limit: 255
  end

  create_table "subcontis", force: :cascade do |t|
    t.integer  "conti_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "subcontis", ["conti_id"], name: "index_subcontis_on_conti_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image",        limit: 255
    t.string   "comment",      limit: 255
    t.integer  "user_id",      limit: 4
    t.integer  "likes_count",  limit: 4
    t.integer  "search_id",    limit: 4
    t.string   "continent",    limit: 255
    t.string   "subcontinent", limit: 255
    t.string   "country",      limit: 255
    t.string   "city",         limit: 255
    t.integer  "map_id",       limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nickname",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cities", "countries"
  add_foreign_key "countries", "subcontis"
  add_foreign_key "subcontis", "contis"
end
