class CreateSingers < ActiveRecord::Migration[5.0]
  def change
    create_table :singers, id: :uuid do |t|
      t.string :name
      t.string :name_translation

      t.timestamps
    end
  end
end
