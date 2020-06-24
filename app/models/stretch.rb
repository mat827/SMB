class Stretch < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true

  attachment :image

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user, optional: true

  def self.search(str)
    return all unless str
    where(["name LIKE ?", "%#{str}%"])
  end
end
