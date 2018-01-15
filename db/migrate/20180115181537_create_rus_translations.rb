class CreateRusTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :rus_translations do |t|
      t.references :eng_word, foreign_key: true
      t.references :rus_word, foreign_key: true
    end
  end
end
