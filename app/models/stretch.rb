class Stretch < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true

  attachment :image

  def self.search(str)
    return all unless str
    where(["name LIKE ?", "%#{str}%"])
  end
end
