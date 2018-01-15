require 'test_helper'

class RusTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rus_translation = rus_translations(:one)
  end

  test "should get index" do
    get rus_translations_url
    assert_response :success
  end

  test "should get new" do
    get new_rus_translation_url
    assert_response :success
  end

  test "should create rus_translation" do
    assert_difference('RusTranslation.count') do
      post rus_translations_url, params: { rus_translation: { eng_word_id: @rus_translation.eng_word_id, rus_word_id: @rus_translation.rus_word_id } }
    end

    assert_redirected_to rus_translation_url(RusTranslation.last)
  end

  test "should show rus_translation" do
    get rus_translation_url(@rus_translation)
    assert_response :success
  end

  test "should get edit" do
    get edit_rus_translation_url(@rus_translation)
    assert_response :success
  end

  test "should update rus_translation" do
    patch rus_translation_url(@rus_translation), params: { rus_translation: { eng_word_id: @rus_translation.eng_word_id, rus_word_id: @rus_translation.rus_word_id } }
    assert_redirected_to rus_translation_url(@rus_translation)
  end

  test "should destroy rus_translation" do
    assert_difference('RusTranslation.count', -1) do
      delete rus_translation_url(@rus_translation)
    end

    assert_redirected_to rus_translations_url
  end
end
