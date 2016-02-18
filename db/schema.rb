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

ActiveRecord::Schema.define(version: 20160218135542) do

  create_table "accounts", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "accounts_slides", id: false, force: :cascade do |t|
    t.integer "account_id"
    t.integer "slide_id"
  end

  add_index "accounts_slides", ["account_id"], name: "index_accounts_slides_on_account_id"
  add_index "accounts_slides", ["slide_id"], name: "index_accounts_slides_on_slide_id"

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "pdf_file_id"
    t.integer  "slide_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["pdf_file_id"], name: "index_comments_on_pdf_file_id"
  add_index "comments", ["slide_id"], name: "index_comments_on_slide_id"

  create_table "pdf_files", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.integer  "likes"
    t.integer  "pdf_file_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "p_num"
  end

  add_index "slides", ["pdf_file_id"], name: "index_slides_on_pdf_file_id"

end
