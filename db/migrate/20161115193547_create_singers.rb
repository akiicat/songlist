class CreateSingers < ActiveRecord::Migration[5.0]
  def change
    create_table :singers, id: :uuid do |t|
      t.string :name
      t.string :name_translation

      t.integer :count_of_singer_songs
      t.integer :count_of_composer_songs

      t.timestamps
    end
  end
end
