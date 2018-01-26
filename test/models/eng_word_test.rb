require 'test_helper'

class EngWordTest < ActiveSupport::TestCase
  fixtures :eng_words
  test "part_of_speech enum" do
    assert eng_words(:hello_noun).part_of_speech == 'noun'
    assert eng_words(:move_noun).part_of_speech == 'noun'
    assert eng_words(:move_verb).part_of_speech == 'verb'
  end

  test "uniqueness" do
    EngWord.create(word: 'word', part_of_speech: 'noun')
    assert_difference('EngWord.count', 0) do
      EngWord.create(word: 'word', part_of_speech: 'noun')
    end

    assert_difference('EngWord.count', 1) do
      EngWord.create(word: 'word', part_of_speech: 'verb')
    end

  end
end
