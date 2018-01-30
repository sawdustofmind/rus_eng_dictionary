class EngWord < ApplicationRecord
  enum part_of_speech: [:noun,
                        :verb,
                        :adjective,
                        :adverb,
                        :pronoun,
                        :preposition,
                        :conjunction,
                        :interjection,
                        :determiner]

  has_many :rus_translations
  has_many :rus_words, through: :rus_translations
  validates :word, presence: true, uniqueness: { scope: :part_of_speech }
end
