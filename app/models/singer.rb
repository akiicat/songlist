class Singer < ApplicationRecord
  has_many :songs

  def name_with_translation
    rtn  = "#{self.name}"
    rtn += " / #{self.name_translation}" unless self.name_translation.blank?
    rtn.strip
  end

  def self.find_singer(name, trans = nil)
    trans ||= ""
    Singer.find_by(name: name, name_translation: trans) || Singer.create(name: name, name_translation: trans)
  end
end
