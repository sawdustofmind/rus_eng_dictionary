require 'test_helper'

class TestResultsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:tom)
    @test_result = test_results(:one)
  end

  test "should get index" do
    get test_results_url
    assert_response :success
  end

  test "should create test_result" do
    voc_test = VocabularyTest.generate(users(:tom))
    entries = {}
    voc_test.test_line_items.each do |line_item|
      entries[line_item.eng_word.id] = line_item.test_options.sample.option
    end
    assert_difference('TestResult.count', 1) do
      assert_difference('TestResultLineItem.count', entries.count) do
        post test_results_url, params: {
          test_result: {
            vocabulary_test_id: voc_test.id,
            entries: entries
          }
        }
      end
    end

    assert_redirected_to test_result_url(TestResult.last)
  end

  test "should show test_result" do
    get test_result_url(@test_result)
    assert_response :success
  end

  test "should destroy test_result" do
    assert_difference('TestResult.count', -1) do
      delete test_result_url(@test_result)
    end

    assert_redirected_to test_results_url
  end
end
