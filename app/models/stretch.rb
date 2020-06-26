# frozen_string_literal: true

class Stretch < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true

  attachment :image

  # お気に入り投稿と関連付け
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user, optional: true

  # 口コミ投稿との関連付け
  has_many :reviews, dependent: :destroy

  def self.search(str)
    return all unless str

    where(['name LIKE ?', "%#{str}%"])
  end
end
