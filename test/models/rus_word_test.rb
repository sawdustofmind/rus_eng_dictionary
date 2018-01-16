require 'test_helper'

class RusWordTest < ActiveSupport::TestCase
  test "uniqueness" do
    RusWord.create(word: 'Слово')
    assert_difference('RusWord.count', 0) do
      RusWord.create(word: 'Слово')
    end
  end
end
