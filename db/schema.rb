# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_21_140347) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "pic"
    t.text "about"
    t.string "past_roles"
    t.index ["email"], name: "index_actors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_actors_on_reset_password_token", unique: true
    t.index ["username"], name: "index_actors_on_username", unique: true
  end

  create_table "auditions", force: :cascade do |t|
    t.time "time"
    t.integer "actor_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "casting_agents", force: :cascade do |t|
    t.string "name"
    t.string "agency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "pic"
    t.text "about"
    t.index ["email"], name: "index_casting_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_casting_agents_on_reset_password_token", unique: true
    t.index ["username"], name: "index_casting_agents_on_username", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "location"
    t.integer "casting_agent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "production_type"
    t.string "pic"
    t.text "about"
    t.string "show_dates"
    t.string "show_location"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "event_id"
    t.time "requested_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
