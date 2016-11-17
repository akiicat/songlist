class Songlist < ApplicationRecord
  belongs_to :playlist, :class_name => "Playlist", :foreign_key => "playlist_id"
  belongs_to :song    , :class_name => "Song"    , :foreign_key => "song_id"
end
