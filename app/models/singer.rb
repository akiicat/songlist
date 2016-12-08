class Singer < ApplicationRecord
  has_many :songs

  def name_with_translation
    rtn  = "#{self.name}"
    rtn += " / #{self.name_translation}" unless self.name_translation.blank?
    rtn.strip
  end

  default_scope { order(count_of_singer_songs: :desc, count_of_composer_songs: :desc) }

  def self.find_singer(name, trans = nil)
    trans ||= ""
    name.strip!
    trans.strip!
    rtn   = Singer.find_by(name: name, name_translation: trans)
    rtn ||= Singer.create(name: name, name_translation: trans, count_of_singer_songs: 0, count_of_composer_songs: 0)
    rtn
  end
end
