class CreateTestResultLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :test_result_line_items do |t|
      t.references :end_word, foreign_key: true
      t.references :test_result, foreign_key: true
      t.text :answer
      t.boolean :right
    end
  end
end
