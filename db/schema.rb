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

ActiveRecord::Schema.define(version: 20170529141507) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date_time"
    t.string   "location"
    t.string   "audience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "saved_events_count"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "company"
    t.string   "position"
    t.string   "location"
    t.text     "job_description"
    t.string   "job_requirements"
    t.string   "job_link"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bookmark_jobs_count"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "company"
    t.string   "position"
    t.boolean  "intern_fulltime"
    t.string   "location"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saved_contacts", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saved_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saved_jobs", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "grad_year"
    t.string   "internship_company"
    t.string   "internship_location"
    t.string   "internship_position"
    t.string   "full_time_company"
    t.string   "full_time_position"
    t.string   "full_time_location"
    t.string   "current_status"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "saved_contacts_count"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grad_year"
    t.string   "industry_focus"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "bookmark_jobs_count"
    t.integer  "saved_events_count"
    t.integer  "saved_contacts_count"
    t.string   "current_job_status"
    t.boolean  "ok_to_invite"
    t.string   "photo"
    t.string   "prior_industry"
    t.string   "prior_company"
    t.string   "prior_location"
    t.string   "prior_position"
    t.boolean  "ok_to_contact"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
