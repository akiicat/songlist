class Song < ApplicationRecord
  has_many :songlists
  has_many :playlists, :through => :songlists

  belongs_to :singer  , :class_name => "Singer", :foreign_key => "singer_id"  , counter_cache: :count_of_singer_songs
  belongs_to :composer, :class_name => "Singer", :foreign_key => "composer_id", counter_cache: :count_of_composer_songs
  accepts_nested_attributes_for :singer
  accepts_nested_attributes_for :composer

  def title_with_translation
    rtn  = "#{self.title}"
    rtn += " / #{self.title_translation}" unless self.title_translation.blank?
    rtn.strip
  end

  def name_all
    singer     = self.singer.name_with_translation   if self.singer
    composer   = self.composer.name_with_translation if self.composer
    title      = self.title_with_translation
    supplement = "#{composer} #{self.description}".strip

    results = (singer.blank? or title.blank?) ? "#{singer}#{title}" : "#{singer} - #{title}"
    results += " (#{supplement})" unless supplement.blank?

    return results
  end

  def self.search(search)
    if search
      # OR singer.name LIKE UPPER(:search) includes(:singer, :composer)
      # where(Song.arel_table[:title].matches("%#{search}%")).includes(:singer, :composer)
      joins("LEFT OUTER JOIN singers ON singers.id = songs.singer_id OR singers.id = songs.composer_id").where('UPPER(songs.title) LIKE UPPER(:search) OR UPPER(singers.name) LIKE UPPER(:search)', search: "%#{search}%").distinct.includes(:singer, :composer)
      # joins(:singer, :composer).where('UPPER(songs.title) LIKE UPPER(:search) OR UPPER(singers.name) LIKE UPPER(:search)', search: "%#{search}%").includes(:singer, :composer)
    else
      all
    end
  end
end
