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

ActiveRecord::Schema.define(version: 20160601011256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer "cmc"
    t.string  "flavor"
    t.string  "image_name"
    t.string  "layout"
    t.string  "mana_cost"
    t.integer "multiverse_id"
    t.string  "name"
    t.integer "number"
    t.string  "power"
    t.string  "rarity"
    t.string  "text"
    t.string  "card_type"
  end

  create_table "cards_colors", id: false, force: :cascade do |t|
    t.integer "card_id",  null: false
    t.integer "color_id", null: false
    t.index ["color_id", "card_id"], name: "index_cards_colors_on_color_id_and_card_id", using: :btree
  end

  create_table "cards_subtypes", id: false, force: :cascade do |t|
    t.integer "card_id",    null: false
    t.integer "subtype_id", null: false
    t.index ["subtype_id", "card_id"], name: "index_cards_subtypes_on_subtype_id_and_card_id", using: :btree
  end

  create_table "cards_types", id: false, force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "type_id", null: false
    t.index ["type_id", "card_id"], name: "index_cards_types_on_type_id_and_card_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks_cards", id: false, force: :cascade do |t|
    t.integer "deck_id", null: false
    t.integer "card_id", null: false
    t.integer "amount"
    t.index ["deck_id", "card_id"], name: "index_decks_cards_on_deck_id_and_card_id", using: :btree
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "name"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

end