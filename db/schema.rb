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

ActiveRecord::Schema.define(version: 20170515080234) do

  create_table "tickets", force: :cascade do |t|
    t.integer "number_of_place"
    t.boolean "available"
    t.integer "timetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", default: 0
    t.index ["timetable_id"], name: "index_tickets_on_timetable_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.integer "amount_of_place"
    t.string "place_depart"
    t.string "place_arrive"
    t.datetime "time_depart"
    t.datetime "time_arrive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 25
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.integer "ticket_id"
    t.index ["ticket_id"], name: "index_users_on_ticket_id"
  end

end
