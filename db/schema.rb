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

ActiveRecord::Schema.define(version: 2020_06_05_114326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "author_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rate_id"
    t.integer "user_id"
    t.float "average_rate"
    t.index ["rate_id"], name: "index_posts_on_rate_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.decimal "rate"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_rates_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "rates", "posts"
end
