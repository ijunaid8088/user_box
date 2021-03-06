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

ActiveRecord::Schema.define(version: 20170312092456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_admin"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.string   "namespace"
    t.integer  "admin_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["admin_id"], name: "index_companies_on_admin_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "body"
    t.text     "subject"
    t.integer  "state"
    t.integer  "head"
    t.integer  "tail"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "cc",           default: [],              array: true
    t.integer  "bcc",          default: [],              array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "is_first_login"
    t.string   "username"
    t.string   "actual_password"
  end

  add_foreign_key "companies", "admins"
end
