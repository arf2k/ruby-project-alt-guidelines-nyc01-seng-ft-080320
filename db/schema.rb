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

ActiveRecord::Schema.define(version: 2020_08_18_160147) do

  create_table "appointments", force: :cascade do |t|
    t.integer "date"
    t.string "time"
    t.string "description"
    t.integer "artist_id"
    t.integer "tattooshop_id"
    t.integer "client_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.boolean "does_piercings?"
    t.integer "tattooshop_id"
  end

  create_table "blacklist", force: :cascade do |t|
    t.string "reason_for_ban"
    t.boolean "lifetime_ban?"
    t.integer "date_of_ban"
    t.integer "client_id"
    t.integer "tattooshop_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "blacklist_id"
  end

end
