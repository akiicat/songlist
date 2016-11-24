class Songlist < ApplicationRecord
  belongs_to :playlist, :class_name => "Playlist", :foreign_key => "playlist_id"
  belongs_to :song    , :class_name => "Song"    , :foreign_key => "song_id"
  belongs_to :prefix  , :class_name => "Songinfo", :foreign_key => "prefix_id"
  belongs_to :suffix  , :class_name => "Songinfo", :foreign_key => "suffix_id"


  # scoping
  def self.where_all_element(element)
    where(element).includes(:playlist, :prefix, :suffix, :song => [:singer, :composer])
  end
end
