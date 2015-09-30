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

ActiveRecord::Schema.define(version: 20150928141959) do

  create_table "pamer_actualvalues", force: :cascade do |t|
    t.string  "code"
    t.integer "order_id"
    t.integer "value"
  end

  create_table "pamer_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pamer_items_packages", force: :cascade do |t|
    t.integer "package_id"
    t.integer "item_id"
    t.integer "count"
    t.boolean "optional",   default: true
    t.boolean "repeatable"
  end

  create_table "pamer_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "count"
    t.string   "state"
    t.datetime "expires"
    t.integer  "repeat"
    t.string   "currency"
    t.integer  "orderable_id"
    t.string   "orderable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pamer_orders", ["orderable_type", "orderable_id"], name: "index_pamer_orders_on_orderable_type_and_orderable_id"

  create_table "pamer_packages", force: :cascade do |t|
    t.string   "name"
    t.boolean  "repeatable"
    t.datetime "expires"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pamer_prices", force: :cascade do |t|
    t.integer  "priceable_id"
    t.string   "priceable_type"
    t.string   "pricetype"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pamer_prices", ["priceable_type", "priceable_id"], name: "index_pamer_prices_on_priceable_type_and_priceable_id"

end
