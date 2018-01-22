class TestResultLineItem < ApplicationRecord
  belongs_to :eng_word
  belongs_to :test_result
end
