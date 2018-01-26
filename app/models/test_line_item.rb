class TestLineItem < ApplicationRecord
  OPTIONS_COUNT = 6

  belongs_to :vocabulary_test
  belongs_to :eng_word

  has_many :test_options
  validates_uniqueness_of :eng_word, scope: :vocabulary_test

  def TestLineItem.generate(eng_word, vocabulary_test)
    line_item = vocabulary_test.test_line_items.build eng_word: eng_word

    right_answers = line_item.eng_word.rus_words
    right_answers_ids = right_answers.ids

    other_words = RusWord.where.not(id: right_answers_ids)
                      .order(DATABASE_RANDOM_FUNCTION).limit(OPTIONS_COUNT - 1)

    line_item.test_options.build option: right_answers.sample.word
    other_words.each do |another_rus_word|
      line_item.test_options.build option: another_rus_word.word
    end
  end
end
