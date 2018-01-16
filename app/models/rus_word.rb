class RusWord < ApplicationRecord
	has_many :rus_translation

	validates :word, presence: true, uniqueness: true
end
