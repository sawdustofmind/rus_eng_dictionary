class CreateVocabularyTests < ActiveRecord::Migration[5.1]
  def change
    create_table :vocabulary_tests do |t|
      t.timestamp :sent
      t.integer :interval
      t.boolean :passed
    end
  end
end
