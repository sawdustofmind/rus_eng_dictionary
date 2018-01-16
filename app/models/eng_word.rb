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

  has_many :rus_translation
  validates :word, presence: true, uniqueness: { scope: :part_of_speech }
end
