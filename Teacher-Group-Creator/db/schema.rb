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

ActiveRecord::Schema.define(version: 20170510181201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "phase",                  null: false
    t.string   "gender"
    t.float    "gpa"
    t.integer  "num_detentions"
    t.string   "shirt_size"
    t.string   "dietitary_restrictions"
    t.string   "emergency_contact_name", null: false
    t.string   "emergency_contact_num",  null: false
    t.integer  "teacher_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.integer  "admin_status",    default: 2, null: false
    t.string   "password_digest",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
