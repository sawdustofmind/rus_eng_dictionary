class TestResult < ApplicationRecord
  belongs_to :user

  has_many :test_result_line_items, dependent: :destroy

  def TestResult.complete_test(params, user)
    # parsing params
    test_id = params[:vocabulary_test_id]
    results = params[:entries]

    # validation
    raise ActiveModel::ForbiddenAttributesError \
      unless params.permitted? && results && results.permitted?

    # validation the answers
    vocabulary_test = VocabularyTest.find test_id
    expected_ids = vocabulary_test.test_line_items.map{|line_item| line_item.eng_word.id}
    real_ids = results.keys.map{|eng_word_id| eng_word_id.to_i}
    raise ActiveRecord::RecordNotFound \
        if expected_ids.sort != real_ids.sort

    # destoy useless test
    vocabulary_test.destroy

    # calc time
    remaining = Time.now - vocabulary_test.sent
    test_result = TestResult.create user: user,
                                     total_time: vocabulary_test.interval, remaining: remaining

    # creating related models
    results.each do |eng_word_id, answer|
      eng_word = EngWord.find eng_word_id
      right_answers = eng_word.rus_words.map{|rus_word| rus_word.word}
      right = right_answers.include? answer

      test_result.test_result_line_items.create \
        eng_word: eng_word, answer: answer, right: right
    end
    test_result
  end
end
