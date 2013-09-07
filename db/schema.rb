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

ActiveRecord::Schema.define(version: 20130907142401) do

  create_table "project_skill_users", force: true do |t|
    t.integer  "project_id"
    t.integer  "skill_id"
    t.integer  "user_id"
    t.integer  "user_id_accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_skill_users", ["project_id"], name: "index_project_skill_users_on_project_id", unique: true, using: :btree
  add_index "project_skill_users", ["skill_id", "user_id"], name: "index_project_skill_users_on_skill_id_and_user_id", unique: true, using: :btree
  add_index "project_skill_users", ["skill_id"], name: "index_project_skill_users_on_skill_id", using: :btree
  add_index "project_skill_users", ["user_id"], name: "index_project_skill_users_on_user_id", using: :btree

  create_table "project_skills", force: true do |t|
    t.integer  "project_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_skills", ["project_id", "skill_id"], name: "index_project_skills_on_project_id_and_skill_id", unique: true, using: :btree
  add_index "project_skills", ["project_id"], name: "index_project_skills_on_project_id", using: :btree
  add_index "project_skills", ["skill_id"], name: "index_project_skills_on_skill_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "is_full",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.text     "description"
    t.integer  "is_active",   default: 1
  end

  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id", "skill_id"], name: "index_user_skills_on_user_id_and_skill_id", unique: true, using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "nickname"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
