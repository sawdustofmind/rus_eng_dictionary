class RusTranslation < ApplicationRecord
  belongs_to :eng_word
  belongs_to :rus_word

  validates :eng_word, :rus_word, presence: true
  validates_uniqueness_of :eng_word, scope: :rus_word
  validates_associated :eng_word, :rus_word

  def RusTranslation.from_params(params)
    # parsing parameters
    part_of_speech = params[:part_of_speech]
    rus_word_value = params[:rus_word]
    eng_word_value = params[:eng_word]

    # getting / creating words entries
    eng_word = EngWord.find_by(word: eng_word_value, part_of_speech: part_of_speech) \
      || EngWord.new(word: eng_word_value, part_of_speech: part_of_speech)
    rus_word = RusWord.find_by(word: rus_word_value) \
      || RusWord.new(word: rus_word_value)

    # creating rus_translation entry
    RusTranslation.new(eng_word: eng_word, rus_word: rus_word)
  end

  after_destroy :delete_useless_records

  private
  def delete_useless_records
    eng_word.destroy if eng_word.rus_translations.empty?
    rus_word.destroy if rus_word.rus_translations.empty?
  end
end
 