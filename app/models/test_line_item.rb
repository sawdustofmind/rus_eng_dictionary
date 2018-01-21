class TestLineItem < ApplicationRecord
  belongs_to :vocabulary_test
  belongs_to :eng_word

  has_many :test_options
end
