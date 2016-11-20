class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists, id: :uuid do |t|
      t.string :video_url
      t.string :title
      t.datetime :streamed_at

      t.datetime :published_at
      t.timestamps
    end
  end
end
