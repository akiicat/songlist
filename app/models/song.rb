class Song < ApplicationRecord
  has_many :songlists
  has_many :playlists, :through => :songlists

  belongs_to :singer  , :class_name => "Singer", :foreign_key => "singer_id"
  belongs_to :composer, :class_name => "Singer", :foreign_key => "composer_id"

  def title_info
    if self.title_translation.blank?
      "#{self.title}"
    else
      "#{self.title} / #{self.title_translation}"
    end
  end

  def song_info
    singer     = self.singer.name_info if self.singer
    composer   = self.composer.name_info if self.composer
    song_info  = "#{singer} - #{self.title_info}".strip
    supplement = "#{composer} #{self.description}".strip

    if self.composer.blank? and self.description.blank? and singer.blank? and self.title_info.blank?
      ""
    elsif self.composer.blank? and self.description.blank?
      "#{song_info}"
    else
      "#{song_info} (#{supplement})"
    end
  def self.all_element
    all.includes(:singer, :composr)
  end
end
