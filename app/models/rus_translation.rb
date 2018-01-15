class RusTranslation < ApplicationRecord
  belongs_to :eng_word
  belongs_to :rus_word

  validates_uniqueness_of :eng_word, scope: :rus_word
end
