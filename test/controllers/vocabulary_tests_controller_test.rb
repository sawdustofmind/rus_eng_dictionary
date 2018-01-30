require 'test_helper'

class VocabularyTestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:tom)
    @vocabulary_test = vocabulary_tests(:one)
  end

  test "should get index" do
    get vocabulary_tests_url
    assert_response :success
  end

  test "should create vocabulary_test" do
    assert_difference('VocabularyTest.count', 1) do
      post vocabulary_tests_url
    end

    assert_redirected_to vocabulary_test_url(VocabularyTest.last)
  end

  test "should show vocabulary_test" do
    puts '-' * 100, users(:tom).inspect, '-' * 100
    puts '-' * 100, @vocabulary_test.user.inspect, '-' * 100
    get vocabulary_test_url(@vocabulary_test)
    assert_response :success
  end

  test "should destroy vocabulary_test" do
    assert_difference('VocabularyTest.count', -1) do
      delete vocabulary_test_url(@vocabulary_test)
    end

    assert_redirected_to vocabulary_tests_url
  end
end
