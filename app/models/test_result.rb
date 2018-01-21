class TestResult < ApplicationRecord
  belongs_to :user

  has_many :test_result_line_items
end
