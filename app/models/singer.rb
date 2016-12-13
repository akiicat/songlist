class Singer < ApplicationRecord
  has_many :songs
  has_many :composers_songs, foreign_key: :composer_id, class_name: 'Song'

  default_scope { order(count_of_singer_songs: :desc, count_of_composer_songs: :desc) }
  after_update :check_singer

  def name_with_translation
    [self.name, self.name_translation].reject{ |x| x.blank? }.join(" / ")
  end

  def check_singer
    repeat_singers = Singer.unscoped.select(:name,:name_translation).group(:name,:name_translation).having("count(*) > 1")
    repeat_singers.each do |singer|
      singers = Singer.where(name: singer.name, name_translation: singer.name_translation).to_a
      target_id = singers.shift.id

      singers.each do |s|
        Song.unscoped.where(singer_id: s.id).update_all(singer_id: target_id)
        Song.unscoped.where(composer_id: s.id).update_all(composer_id: target_id)
        Singer.reset_counters(s.id, :songs, :composers_songs)
      end

      Singer.reset_counters(target_id, :songs, :composers_songs)
    end

    Singer.where(count_of_singer_songs: 0, count_of_composer_songs: 0).delete_all
  end

  def self.find_singer(name, trans = nil)
    Singer.find_or_create_by(name: name.to_s.strip, name_translation: trans.to_s.strip)
  end
end
