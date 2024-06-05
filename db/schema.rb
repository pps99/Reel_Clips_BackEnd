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

ActiveRecord::Schema.define(version: 2024_06_03_080415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "video_standard"
    t.string "video_definition"
    t.string "start_timecode"
    t.string "end_timecode"
    t.bigint "show_reel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_reel_id"], name: "index_clips_on_show_reel_id"
  end

  create_table "show_reels", force: :cascade do |t|
    t.string "name"
    t.string "video_standard"
    t.string "video_definition"
    t.string "total_duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clips", "show_reels"
end
