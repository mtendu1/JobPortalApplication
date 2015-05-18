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

ActiveRecord::Schema.define(version: 20150521070707) do

  create_table "appliedjobs", force: :cascade do |t|
    t.integer  "jobseeker_id"
    t.integer  "job_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "company_phone"
    t.string   "ein"
    t.string   "contact_person_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "Industry_type"
    t.string   "State"
    t.string   "Country"
    t.string   "address"
    t.integer  "user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "company_name"
    t.string   "job_title"
    t.string   "job_code"
    t.string   "job_location"
    t.string   "job_description"
    t.string   "job_type"
    t.date     "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "employer_id"
  end

  create_table "jobseekers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "user_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userType"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
