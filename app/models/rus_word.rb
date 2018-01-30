class RusWord < ApplicationRecord
	has_many :rus_translations
	has_many :rus_words, through: :rus_translations
	validates :word, presence: true, uniqueness: true
end
