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

ActiveRecord::Schema.define(version: 2022_02_05_184730) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.integer "location_id"
    t.integer "user_id"
    t.string "global", default: "F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_ingredients_on_location_id"
    t.index ["state_id"], name: "index_ingredients_on_state_id"
    t.index ["user_id"], name: "index_ingredients_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "global", default: "F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.integer "unit_id"
    t.string "prep_instructions"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amount"
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "step_number"
    t.string "step_text"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_steps_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_steps_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "global", default: "F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "IP"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "global", default: "F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_states_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "global", default: "F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "admin", default: "F"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
