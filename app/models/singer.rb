class Singer < ApplicationRecord
  has_many :songs

  def name_with_translation
    if self.name_translation.blank?
      "#{self.name}"
    else
      "#{self.name} / #{singer.name_translation}"
    end
  end

  def self.find_singer(name, trans = nil)
    trans ||= ""
    Singer.find_by(name: name, name_translation: trans) || Singer.create(name: name, name_translation: trans)
  end
end
