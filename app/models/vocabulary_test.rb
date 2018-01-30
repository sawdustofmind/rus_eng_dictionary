class VocabularyTest < ApplicationRecord
  ITEMS_COUNT = 20
  STANDARD_INTERVAL = 30.minutes

  belongs_to :user
  has_many :test_line_items, dependent: :destroy

  def VocabularyTest.generate(user)
    vocabulary_test = VocabularyTest.create user: user, interval: STANDARD_INTERVAL
    eng_words = EngWord.order(DATABASE_RANDOM_FUNCTION).limit(ITEMS_COUNT)

    eng_words.each do |eng_word|
      TestLineItem.generate eng_word, vocabulary_test
    end

    vocabulary_test.sent = Time.now
    vocabulary_test.save
    vocabulary_test
  end
end
