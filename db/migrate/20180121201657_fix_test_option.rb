class FixTestOption < ActiveRecord::Migration[5.1]
  def change
    change_table :test_options do |t|
      t.references :test_line_item
      t.text :option
    end
  end
end
