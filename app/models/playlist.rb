class Playlist < ApplicationRecord
  has_many :songlists
  has_many :songs, :through => :songlists
end
