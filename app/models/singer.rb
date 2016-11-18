class Singer < ApplicationRecord
  has_many :songs

  def name_info
    if self.name_translation.blank?
      "#{self.name}"
    else
      "#{self.name} / #{singer.name_translation}"
    end
  end
end
