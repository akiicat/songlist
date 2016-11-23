class Playlist < ApplicationRecord
  has_many :songlists
  has_many :songs, :through => :songlists

  before_create :add_title

  def get_info_from_api
    result = {}
    if match = /v=(\S+?)(&|$)/.match(self.video_url)
      video = Yt::Video.new(id: match[1])
      result = {
        title: video.title,
        published_at: video.published_at
      }
    end
    return result
  end

private

  def add_title
    if info = get_info_from_api
      self.title        = info[:title]        if self.title.blank?
      self.published_at = info[:published_at]
    end
  end
end
