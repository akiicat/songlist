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
end
