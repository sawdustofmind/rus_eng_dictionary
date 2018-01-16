require 'test_helper'

class RusTranslationsControllerTest < ActionDispatch::IntegrationTest
  fixtures :rus_words, :eng_words, :rus_translations

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
      post rus_translations_url, 
        params: { 
          rus_translation: { 
            part_of_speech: 'verb',
            eng_word: 'go', 
            rus_word: 'идти'
          } 
        }
    end

    assert_redirected_to rus_translations_url
  end


  test "should destroy rus_translation" do
    assert_difference('RusTranslation.count', -1) do
      delete rus_translation_url(@rus_translation)
    end

    assert_redirected_to rus_translations_url
  end
end
