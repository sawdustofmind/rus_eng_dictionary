require 'test_helper'

class VocabularyTestTest < ActiveSupport::TestCase
  fixtures :users
  test "vocabulary test generation" do
    assert_difference('TestLineItem.count', 3) do
      assert_difference('TestOption.count', 11) do
        VocabularyTest.generate(users(:tom))
      end
    end
  end
end
