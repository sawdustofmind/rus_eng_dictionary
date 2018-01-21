class FixedVocabularyTestModel < ActiveRecord::Migration[5.1]
  def change
    change_table :vocabulary_tests do |t|
      t.references :user
      t.remove :passed
    end
  end

  def up
    VocabularyTest.destroy_all
  end

  def down
    resque ActiveRecord::IrreversibleMigration
  end
end
