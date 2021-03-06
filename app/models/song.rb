class Song < ApplicationRecord
  has_many :songlists
  has_many :playlists, through: :songlists

  belongs_to :singer  , class_name: "Singer", foreign_key: "singer_id"  , counter_cache: :count_of_singer_songs
  belongs_to :composer, class_name: "Singer", foreign_key: "composer_id", counter_cache: :count_of_composer_songs
  accepts_nested_attributes_for :singer
  accepts_nested_attributes_for :composer

  default_scope { includes(:singer, :composer).order("lower(singers.name)", "title").references(:singers) }

  def title_with_translation
    [self.title, self.title_translation].reject{ |x| x.blank? }.join(" / ")
  end

  def name_all
    results = [self.singer.name_with_translation, self.title_with_translation].reject{ |x| x.blank? }.join(" - ")
    [results, supplement].reject{ |x| x.blank? }.join(" ")
  end

  def supplement
    s = [self.composer.name_with_translation, self.description].reject{ |x| x.blank? }.join(" ")
    (s.blank?) ? "" : "(#{s})"
  end

  def self.export
    all.as_json(except: [:id, :singer_id, :composer_id, :created_at, :updated_at],
                include: {
                  singer:   { only: [:name, :name_translation] },
                  composer: { only: [:name, :name_translation] }
                } )
  end

  def self.render
    all.as_json(only: [:id, :singer_id, :lyric_url, :video_url],
                include: {
                  singer:   { only: [], methods: [:name_with_translation] },
                  composer: { only: [], methods: [:name_with_translation] }
                },
                methods: [:name_all, :title_with_translation, :supplement] )
  end

  def self.search(search)
    if search.blank?
      all
    else
      sql = 'CONCAT(singers.name, \' \', singers.name_translation, \' \',
                    composers_songs.name, \' \', composers_songs.name_translation, \' \',
                    songs.title, \' \', songs.title_translation, \' \',
                    songs.description)
             ILIKE all (array[:search])'
      joins(:singer, :composer).where(sql, search: search.split.map{ |s| "%#{s}%" })
    end
  end
end
