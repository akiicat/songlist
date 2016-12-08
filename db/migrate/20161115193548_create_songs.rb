class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs, id: :uuid do |t|
      t.uuid :singer_id, foreign_key: true
      t.uuid :composer_id, foreign_key: true
      t.string :title
      t.string :title_translation
      t.string :description
      t.string :lyric_url
      t.string :video_url

      t.timestamps
    end
  end
end
