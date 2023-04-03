# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 6) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_times", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "doctor_id", null: false
    t.string "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "time_schedule_id", null: false
    t.index ["doctor_id"], name: "index_doctor_times_on_doctor_id"
    t.index ["time_schedule_id"], name: "index_doctor_times_on_time_schedule_id"
  end

  create_table "doctors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "major"
    t.string "profile_picture"
    t.float "fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "doctor_time_id", null: false
    t.index ["doctor_time_id"], name: "index_time_schedules_on_doctor_time_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "jti", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctor_times", "doctors"
  add_foreign_key "doctor_times", "time_schedules"
  add_foreign_key "time_schedules", "doctor_times"
end
