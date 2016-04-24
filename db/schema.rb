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

ActiveRecord::Schema.define(version: 20160424202129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "details", force: :cascade do |t|
    t.string   "church_name"
    t.string   "event_name"
    t.string   "title"
    t.string   "top_comment"
    t.text     "notes"
    t.integer  "user_id",                     null: false
    t.boolean  "premium",     default: false
    t.string   "image_data"
    t.date     "remove_date"
    t.boolean  "disable",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "event_submissions", force: :cascade do |t|
    t.string   "full_name"
    t.string   "event_name"
    t.text     "event_description"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "taking_place"
    t.string   "taking_place_where"
    t.boolean  "registration_required", default: false
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone_number"
    t.string   "email_address"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone_number"
    t.string   "email_address"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "full_name"
    t.string   "event_name"
    t.text     "event_description"
    t.date     "event_date"
    t.date     "start_time"
    t.date     "end_time"
    t.string   "taking_place"
    t.string   "taking_place_where"
    t.boolean  "registration_required", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "subdomain"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subdomain"], name: "index_users_on_subdomain", unique: true, using: :btree

end
