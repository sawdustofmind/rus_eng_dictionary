class FixTestResultLineItem < ActiveRecord::Migration[5.1]
  def change
    rename_column :test_result_line_items, :end_word_id, :eng_word_id
  end
end
