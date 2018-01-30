require 'test_helper'

class RusTranslationTest < ActiveSupport::TestCase
  fixtures :rus_translations

  def assert_differences(rus_translation_dif, eng_word_dif, rus_word_dif)
    assert_difference('RusTranslation.count', rus_translation_dif) do
      assert_difference('EngWord.count', eng_word_dif) do
        assert_difference('RusWord.count', rus_word_dif) do
          yield
        end
      end
    end
  end

  test "before_destroy trigger" do

    # should destroys only russian word
    rus_translations = rus_translations(:hello_noun_translation_one) # hello
    assert_differences(-1, 0, -1) do
      rus_translations.destroy
    end

    # should destroys all
    rus_translations = rus_translations(:hello_noun_translation_two)
    assert_differences(-1, -1, -1) do
      rus_translations.destroy
    end
  end

  test "uniqueness" do
    assert_difference('EngWord.count', 0) do
      RusTranslation.create rus_word: rus_words(:one), eng_word: eng_words(:hello_noun)
    end
  end

  test "presence" do
    assert_difference('RusTranslation.count', 0) do
      RusTranslation.create
    end

    assert_difference('RusTranslation.count', 0) do
      RusTranslation.create rus_word: rus_words(:one)
    end

    assert_difference('RusTranslation.count', 0) do
      RusTranslation.create eng_word: eng_words(:hello_noun)
    end

    assert_difference('RusTranslation.count', 1) do
      RusTranslation.create eng_word: eng_words(:hello_noun), rus_word: rus_words(:four)
    end
  end
end
