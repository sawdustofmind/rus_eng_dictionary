require 'test_helper'

class EngWordTest < ActiveSupport::TestCase
  fixtures :eng_words
  test "part_of_speech enum" do
    assert eng_words(:one).part_of_speech == 'noun'
    assert eng_words(:two).part_of_speech == 'noun'
    assert eng_words(:three).part_of_speech == 'verb'
  end
end
