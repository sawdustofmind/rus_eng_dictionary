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

ActiveRecord::Schema.define(version: 20180122100243) do

  create_table "eng_words", force: :cascade do |t|
    t.string "word"
    t.integer "part_of_speech"
  end

  create_table "rus_translations", force: :cascade do |t|
    t.integer "eng_word_id"
    t.integer "rus_word_id"
    t.index ["eng_word_id"], name: "index_rus_translations_on_eng_word_id"
    t.index ["rus_word_id"], name: "index_rus_translations_on_rus_word_id"
  end

  create_table "rus_words", force: :cascade do |t|
    t.string "word"
  end

  create_table "test_line_items", force: :cascade do |t|
    t.integer "vocabulary_test_id"
    t.integer "eng_word_id"
    t.index ["eng_word_id"], name: "index_test_line_items_on_eng_word_id"
    t.index ["vocabulary_test_id"], name: "index_test_line_items_on_vocabulary_test_id"
  end

  create_table "test_options", force: :cascade do |t|
    t.integer "test_line_item_id"
    t.text "option"
    t.index ["test_line_item_id"], name: "index_test_options_on_test_line_item_id"
  end

  create_table "test_result_line_items", force: :cascade do |t|
    t.integer "eng_word_id"
    t.integer "test_result_id"
    t.text "answer"
    t.boolean "right"
    t.index ["eng_word_id"], name: "index_test_result_line_items_on_eng_word_id"
    t.index ["test_result_id"], name: "index_test_result_line_items_on_test_result_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_time"
    t.integer "remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_test_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocabulary_tests", force: :cascade do |t|
    t.datetime "sent"
    t.integer "interval"
    t.integer "user_id"
    t.index ["user_id"], name: "index_vocabulary_tests_on_user_id"
  end

end
