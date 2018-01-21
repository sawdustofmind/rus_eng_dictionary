class VocabularyTest < ApplicationRecord
  belongs_to :user
  has_many :test_line_items
end
