class TestOption < ApplicationRecord
  belongs_to :test_line_item

  validates_uniqueness_of :option, scope: :test_line_item
end
