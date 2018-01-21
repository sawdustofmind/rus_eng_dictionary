class VocabularyTest < ApplicationRecord
  ITEMS_COUNT = 20
  STANDARD_INTERVAL = 30

  belongs_to :user
  has_many :test_line_items

  def VocabularyTest.generate(user)
    vocabulary_test = VocabularyTest.create user: user, interval: STANDARD_INTERVAL
    eng_words = EngWord.order('RANDOM()').limit(ITEMS_COUNT)

    eng_words.each do |eng_word|
      TestLineItem.generate vocabulary_test, eng_word
    end

    vocabulary_test.sent = Time.now.to_i
    vocabulary_test
  end
end
