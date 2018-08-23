class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words, id: false do |t|
      t.string :word, primary_key: true
      t.integer :occurrence
    end

    add_index :words, :word
  end
end
