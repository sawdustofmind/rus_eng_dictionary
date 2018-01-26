require 'test_helper'

class TestOptionTest < ActiveSupport::TestCase
  fixtures :test_line_items, :rus_words
  test "uniqueness" do
    test_line_items(:one).test_options.build option: rus_words(:one)
    assert_difference('TestOption.count', 0) do
      test_line_items(:one).test_options.build option: rus_words(:one)
    end
  end
end
