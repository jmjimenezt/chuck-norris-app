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

ActiveRecord::Schema.define(version: 2021_06_08_054502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jokes", id: :string, force: :cascade do |t|
    t.string "url"
    t.string "icon_url"
    t.string "value"
    t.string "categories"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jokes_search_results", id: false, force: :cascade do |t|
    t.string "joke_id"
    t.bigint "search_result_id"
    t.index ["joke_id"], name: "index_jokes_search_results_on_joke_id"
    t.index ["search_result_id"], name: "index_jokes_search_results_on_search_result_id"
  end

  create_table "search_results", force: :cascade do |t|
    t.string "keywords"
    t.string "categories"
    t.boolean "random"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
