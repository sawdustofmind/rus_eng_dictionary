class RusWord < ApplicationRecord
	has_many :rus_translation

	validates_uniqueness_of :word
end
