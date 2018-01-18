class CreateTestLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :test_line_items do |t|
      t.references :vocabulary_test, foreign_key: true
      t.references :rus_translation, foreign_key: true
      t.boolean :right
    end
  end
end
