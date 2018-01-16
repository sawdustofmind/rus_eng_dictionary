require 'test_helper'

class RusTranslationTest < ActiveSupport::TestCase
  fixtures :rus_translations

  def assert_differences(rus_translation_dif, eng_word_dif, rus_word_dif, &block)
    assert_difference('RusTranslation.count', rus_translation_dif) do
      assert_difference('EngWord.count', eng_word_dif) do
        assert_difference('RusWord.count', rus_word_dif) do
          block.call
        end
      end
    end
  end

  test "before_destroy trigger" do

    # should destroys only russian word
    rus_translations = rus_translations(:one) # hello
    assert_differences(-1, 0, -1) do
      rus_translations.destroy
    end

    # should destroys all
    rus_translations = rus_translations(:two)
    assert_differences(-1, -1, -1) do
      rus_translations.destroy
    end
  end

  test "uniqueness" do
    assert_difference('EngWord.count', 0) do
      RusTranslation.create rus_word: rus_words(:one), eng_word: eng_words(:one)
    end
  end
end
