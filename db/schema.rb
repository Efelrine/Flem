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

ActiveRecord::Schema.define(version: 20150402192205) do

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_statuses", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.text     "comment"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "location"
    t.integer  "category_id"
    t.integer  "item_status_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["item_status_id"], name: "index_items_on_item_status_id"
  add_index "items", ["owner_id"], name: "index_items_on_owner_id"

  create_table "loans", force: true do |t|
    t.integer "number"
    t.date    "date_loan"
    t.string  "state"
    t.boolean "is_rendered", default: false, null: false
    t.integer "item_id"
    t.integer "owner_id"
    t.integer "borrower_id"
  end

  add_index "loans", ["item_id"], name: "index_loans_on_item_id"
  add_index "loans", ["owner_id"], name: "index_loans_on_owner_id"

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_primary", default: false, null: false
  end

  create_table "owners_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "owner_id"
  end

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
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
