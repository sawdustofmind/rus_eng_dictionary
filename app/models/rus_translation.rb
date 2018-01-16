class RusTranslation < ApplicationRecord
  belongs_to :eng_word
  belongs_to :rus_word

  validates_uniqueness_of :eng_word, scope: :rus_word
  validates :eng_word, :rus_word, presence:true

  before_destroy :delete_useless_records

  def delete_useless_records
    self.eng_word.destroy if self.eng_word.rus_translation_ids.count == 1
    self.rus_word.destroy if self.rus_word.rus_translation_ids.count == 1
  end
end
 