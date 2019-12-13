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

ActiveRecord::Schema.define(version: 2019_12_13_193804) do

  create_table "girls", force: :cascade do |t|
    t.string "shop_id"
    t.string "name"
    t.string "bust"
    t.string "hip"
    t.string "waist"
    t.integer "age"
    t.integer "height"
    t.time "work_time"
    t.string "erogenous_zone"
    t.text "recommend_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer "girl_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "minutes"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "shop_url"
    t.string "open_time"
    t.integer "price"
    t.string "tell_number"
    t.string "description"
    t.string "title"
    t.string "trip_area"
    t.string "holiday"
    t.integer "admission"
    t.integer "designation_fee"
    t.integer "trans_fee"
    t.string "payment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
