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

ActiveRecord::Schema.define(version: 2020_03_22_163424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gachas", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.bigint "guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guild_id", "key_name"], name: "index_gachas_on_guild_id_and_key_name", unique: true
  end

  create_table "guilds", force: :cascade do |t|
    t.string "discord_id"
    t.string "command_prefix"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discord_id"], name: "index_guilds_on_discord_id", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "chance", default: "0.0"
    t.bigint "gacha_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gacha_id", "name"], name: "index_items_on_gacha_id_and_name", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "guild_id"
    t.string "feature_name"
    t.string "action_name"
    t.text "key_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guild_id", "feature_name", "action_name"], name: "index_permissions_on_guild_id_and_feature_name_and_action_name", unique: true
  end

end
