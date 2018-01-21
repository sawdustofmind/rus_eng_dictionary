class TestOption < ApplicationRecord
  belongs_to :test_line_item

  def TestOption.generate(line_item, options_count)
    right_answers = line_item.eng_word.rus_words
    other_words = RusWord.where.not(id: line_item.eng_word.rus_word_ids)
                      .order('RANDOM()').limit(options_count - 1)

    TestOption.create test_line_item: line_item, option: right_answers.first.word
    other_words.each do |another_rus_word|
      TestOption.create test_line_item: line_item, option: another_rus_word.word
    end
  end
end
