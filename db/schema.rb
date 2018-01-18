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

ActiveRecord::Schema.define(version: 20180118080955) do

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
    t.integer "rus_translation_id"
    t.boolean "right"
    t.index ["rus_translation_id"], name: "index_test_line_items_on_rus_translation_id"
    t.index ["vocabulary_test_id"], name: "index_test_line_items_on_vocabulary_test_id"
  end

  create_table "vocabulary_tests", force: :cascade do |t|
    t.datetime "sent"
    t.integer "interval"
    t.boolean "passed"
  end

end
