require 'test_helper'

class TestResultTest < ActiveSupport::TestCase
  fixtures :test_results
  test "depend destroy" do
    assert_difference('TestResult.count', -1) do
      assert_difference('TestResultLineItem.count', -2) do
        test_results(:one).destroy
      end
    end
  end
end
