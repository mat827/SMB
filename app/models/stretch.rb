# frozen_string_literal: true

class Stretch < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :explanation, presence: true

  # 複数画像投稿と関連付け
  has_many :stretch_images, dependent: :destroy
  accepts_attachments_for :stretch_images, attachment: :image

  # お気に入り投稿と関連付け
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user, optional: true

  # 口コミ投稿との関連付け
  has_many :reviews, dependent: :destroy

  # 管理者側(検索)
  def self.search(str) # self.でクラスメソッドとしている
    return all unless str
    where(['name LIKE ?', "%#{str}%"]) # nameカラムで部分検索
  end
end
