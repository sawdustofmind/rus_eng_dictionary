class FixedTestLineItems < ActiveRecord::Migration[5.1]
  def change
    change_table :test_line_items do |t|
      t.remove :right
      t.remove :rus_translation_id
      t.references :eng_word
    end
  end

  def up
    TestLineItem.destroy_all
  end

  def down
    resque ActiveRecord::IrreversibleMigration
  end
end
