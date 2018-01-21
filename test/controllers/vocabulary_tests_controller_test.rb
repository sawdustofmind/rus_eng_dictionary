require 'test_helper'

class VocabularyTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocabulary_test = vocabulary_tests(:one)
  end

  test "should get index" do
    get vocabulary_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_vocabulary_test_url
    assert_response :success
  end

  test "should create vocabulary_test" do
    assert_difference('VocabularyTest.count') do
      post vocabulary_tests_url, params: { vocabulary_test: {  } }
    end

    assert_redirected_to vocabulary_test_url(VocabularyTest.last)
  end

  test "should show vocabulary_test" do
    get vocabulary_test_url(@vocabulary_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocabulary_test_url(@vocabulary_test)
    assert_response :success
  end

  test "should update vocabulary_test" do
    patch vocabulary_test_url(@vocabulary_test), params: { vocabulary_test: {  } }
    assert_redirected_to vocabulary_test_url(@vocabulary_test)
  end

  test "should destroy vocabulary_test" do
    assert_difference('VocabularyTest.count', -1) do
      delete vocabulary_test_url(@vocabulary_test)
    end

    assert_redirected_to vocabulary_tests_url
  end
end
