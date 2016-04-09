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

ActiveRecord::Schema.define(version: 20160409074659) do

  create_table "players", force: :cascade do |t|
    t.string   "status",     default: "stopped", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "video_id"
  end

  add_index "players", ["status"], name: "index_players_on_status"
  add_index "players", ["video_id"], name: "index_players_on_video_id"

  create_table "playlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "youtube_id"
    t.datetime "played_at"
    t.integer  "playlist_id"
  end

  add_index "videos", ["playlist_id"], name: "index_videos_on_playlist_id"
  add_index "videos", ["youtube_id"], name: "index_videos_on_youtube_id"

end
