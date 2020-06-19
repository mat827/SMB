class Stretch < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true

  attachment :image
end
