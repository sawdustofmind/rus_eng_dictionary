class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.references :user, foreign_key: true
      t.integer :total_time
      t.integer :remaining

      t.timestamps
    end
  end
end
