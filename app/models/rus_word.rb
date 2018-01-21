class RusWord < ApplicationRecord
	has_many :rus_translation
	has_many :rus_words, through: :rus_translation
	validates :word, presence: true, uniqueness: true
end
