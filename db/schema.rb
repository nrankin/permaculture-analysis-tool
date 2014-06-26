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

ActiveRecord::Schema.define(version: 20140625234925) do

  create_table "elements", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element_type"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "value_sets", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "snapshot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "value_sets", ["project_id"], name: "index_value_sets_on_project_id"

  create_table "values", force: true do |t|
    t.integer  "value"
    t.integer  "value_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "element_id"
  end

  add_index "values", ["element_id"], name: "index_values_on_element_id"
  add_index "values", ["value_set_id"], name: "index_values_on_value_set_id"

end
