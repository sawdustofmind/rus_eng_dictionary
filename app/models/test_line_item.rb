class TestLineItem < ApplicationRecord
  OPTIONS_COUNT = 6

  belongs_to :vocabulary_test
  belongs_to :eng_word

  has_many :test_options

  def TestLineItem.generate(vocabulary_test, eng_word)
    line_item = vocabulary_test.test_line_items.build eng_word: eng_word
    TestOption.generate line_item, OPTIONS_COUNT
  end
end
