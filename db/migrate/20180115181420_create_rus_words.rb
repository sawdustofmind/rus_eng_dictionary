class CreateRusWords < ActiveRecord::Migration[5.1]
  def change
    create_table :rus_words do |t|
      t.string :word
    end
  end
end
