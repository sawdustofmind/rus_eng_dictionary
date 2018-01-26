require 'test_helper'

class TestLineItemTest < ActiveSupport::TestCase
  fixtures :vocabulary_tests, :eng_words
  test "uniqueness" do
    vocabulary_tests(:one).test_line_items.build eng_word: eng_words(:move_noun)
    assert_difference('TestLineItem.count', 0) do
      vocabulary_tests(:one).test_line_items.build eng_word: eng_words(:move_noun)
    end
  end
end
