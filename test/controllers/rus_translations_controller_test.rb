require 'test_helper'

class RusTranslationsControllerTest < ActionDispatch::IntegrationTest
  fixtures :rus_translations

  setup do
    @rus_translation = rus_translations(:move_noun_translation)
  end

  test "should get index" do
    get rus_translations_url
    assert_response :success
  end

  test "should create rus_translation" do
    assert_difference('RusTranslation.count', 1) do
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

  test "should not create rus_translation" do
    assert_difference('RusTranslation.count', 0) do
      post rus_translations_url,
       params: {
         rus_translation: {
           part_of_speech: '',
             eng_word: '',
             rus_word: ''
         }
       }
    end

  end

  test "should destroy rus_translation" do
    assert_difference('RusTranslation.count', -1) do
      delete rus_translation_url(@rus_translation)
    end

    assert_redirected_to rus_translations_url
  end
end
