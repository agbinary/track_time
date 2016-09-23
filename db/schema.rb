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

ActiveRecord::Schema.define(version: 20160923150541) do

  create_table "activities", force: :cascade do |t|
    t.integer  "track_type",  null: false
    t.string   "name"
    t.time     "start_time",  null: false
    t.time     "end_time"
    t.date     "date_report", null: false
    t.integer  "total_time"
    t.integer  "status",      null: false
    t.integer  "user_id",     null: false
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["project_id"], name: "index_activities_on_project_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "uid",        null: false
    t.string   "nickname",   null: false
    t.string   "name",       null: false
    t.string   "token",      null: false
    t.string   "secret",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
