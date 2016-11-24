class Song < ApplicationRecord
  has_many :songlists
  has_many :playlists, :through => :songlists

  belongs_to :singer  , :class_name => "Singer", :foreign_key => "singer_id"
  belongs_to :composer, :class_name => "Singer", :foreign_key => "composer_id"

  def title_with_translation
    if self.title_translation.blank?
      "#{self.title}"
    else
      "#{self.title} / #{self.title_translation}"
    end
  end

  def name_all
    singer     = self.singer.name_with_translation   if self.singer
    composer   = self.composer.name_with_translation if self.composer
    title      = self.title_with_translation
    supplement = "#{composer} #{self.description}".strip

    results = (singer.blank? or title.blank?) ? "#{singer} #{title}" : "#{singer} - #{title}"
    results.strip!
    results += " (#{supplement})" unless supplement.blank?

    return results
  end

  def self.all_element
    all.includes(:singer, :composr)
  end
end
