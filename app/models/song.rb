class Song < ApplicationRecord
  has_many :songlists
  has_many :playlists, :through => :songlists

  belongs_to :singer  , :class_name => "Singer", :foreign_key => "singer_id"  , counter_cache: :count_of_singer_songs
  belongs_to :composer, :class_name => "Singer", :foreign_key => "composer_id", counter_cache: :count_of_composer_songs
  accepts_nested_attributes_for :singer
  accepts_nested_attributes_for :composer

  default_scope { includes(:singer, :composer).order("lower(singers.name)", "title").references(:singers) }

  def title_with_translation
    [self.title, self.title_translation].reject{ |x| x.blank? }.join(" / ").strip
  end

  def name_all
    results  = [self.singer.name_with_translation,
                self.title_with_translation].reject{ |x| x.blank? }.join(" - ").strip
    results += " #{supplement}"
    results
  end

  def supplement
    s = "#{self.composer.name_with_translation} #{self.description}".strip
    (s.blank?) ? "" : "(#{s})"
  end

  def self.search(search)
    if search.blank?
      all
    else
      joins(:singer, :composer).where('CONCAT(songs.title, singers.name, composers_songs.name) ILIKE all (array[:search])', search: search.split.map{ |s| "%#{s}%" })
    end
  end
end
