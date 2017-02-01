class AddLyricToSong < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :lyric, :text
  end
end
