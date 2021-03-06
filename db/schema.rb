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

ActiveRecord::Schema.define(version: 20180119175433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "serials", force: :cascade do |t|
    t.string "title", null: false
    t.index ["title"], name: "index_serials_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "chat_id", null: false
    t.index ["chat_id"], name: "index_users_on_chat_id"
  end

  create_table "users_serials", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "serial_id", null: false
    t.index ["serial_id"], name: "index_users_serials_on_serial_id"
    t.index ["user_id"], name: "index_users_serials_on_user_id"
  end

end
