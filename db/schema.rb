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

ActiveRecord::Schema.define(version: 2020_05_26_061022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.string "country"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.date "release_date"
    t.integer "category"
    t.decimal "rating"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "genre_id", null: false
    t.index ["game_id", "genre_id"], name: "index_games_genres_on_game_id_and_genre_id"
    t.index ["genre_id", "game_id"], name: "index_games_genres_on_genre_id_and_game_id"
  end

  create_table "games_platforms", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "platform_id", null: false
    t.index ["game_id", "platform_id"], name: "index_games_platforms_on_game_id_and_platform_id"
    t.index ["platform_id", "game_id"], name: "index_games_platforms_on_platform_id_and_game_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "involved_companies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "game_id", null: false
    t.boolean "developer"
    t.boolean "publisher"
    t.index ["company_id"], name: "index_involved_companies_on_company_id"
    t.index ["game_id"], name: "index_involved_companies_on_game_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.integer "category"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.date "birth_date"
    t.integer "review_count"
  end

  add_foreign_key "involved_companies", "companies"
  add_foreign_key "involved_companies", "games"
  add_foreign_key "reviews", "users"
end
