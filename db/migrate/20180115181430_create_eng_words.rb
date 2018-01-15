class CreateEngWords < ActiveRecord::Migration[5.1]
  def change
    create_table :eng_words do |t|
      t.string :word
      t.integer :part_of_speech
    end
  end
end
