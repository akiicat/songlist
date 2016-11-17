class CreateSonglists < ActiveRecord::Migration[5.0]
  def change
    create_table :songlists, id: :uuid do |t|
      t.uuid :playlist_id, foreign_key: true
      t.uuid :song_id, foreign_key: true
      t.time :time

      t.timestamps
    end
  end
end
