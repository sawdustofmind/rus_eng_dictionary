require 'test_helper'

class VocabularyTestTest < ActiveSupport::TestCase
  fixtures :users
  test "vocabulary test generation" do
    vocabulary_test = nil
    assert_difference('VocabularyTest.count', 1) do
      assert_difference('TestLineItem.count', 3) do
        assert_difference('TestOption.count', 11) do
          vocabulary_test = VocabularyTest.generate(users(:tom))
        end
      end
    end

    assert_difference('VocabularyTest.count', -1) do
      assert_difference('TestLineItem.count', -3) do
        assert_difference('TestOption.count', -11) do
          vocabulary_test.destroy
        end
      end
    end
  end
end
