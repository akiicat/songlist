class CreateSonglists < ActiveRecord::Migration[5.0]
  def change
    create_table :songlists, id: :uuid do |t|
      t.uuid :playlist_id, foreign_key: true
      t.uuid :song_id, foreign_key: true
      t.uuid :prefix_id, foreign_key: true
      t.uuid :suffix_id, foreign_key: true
      t.datetime :marker

      t.timestamps
    end
  end
end
