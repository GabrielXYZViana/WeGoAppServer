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

ActiveRecord::Schema.define(version: 20160816133123) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "adress"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "operating_now"
    t.time     "time_opens"
    t.time     "time_closes"
    t.string   "token"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "company_images"
    t.integer  "user_id"
    t.string   "days"
    t.integer  "subcategory_id"
    t.integer  "category_id"
    t.string   "phone"
  end

  add_index "companies", ["category_id"], name: "index_companies_on_category_id"
  add_index "companies", ["subcategory_id"], name: "index_companies_on_subcategory_id"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
  end

  add_index "favorites", ["company_id"], name: "index_favorites_on_company_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer "rate"
    t.integer "user_id"
    t.integer "company_id"
    t.string  "comment"
  end

  add_index "ratings", ["company_id"], name: "index_ratings_on_company_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "average_rating"
    t.integer  "distance"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "id_social"
    t.string   "token"
    t.string   "password_digest"
    t.string   "password_reset_key"
    t.datetime "password_reset_sent_at"
    t.date     "birthday"
    t.string   "gender"
    t.string   "auth_token"
    t.text     "picture"
    t.string   "description"
    t.string   "phone"
  end

end
