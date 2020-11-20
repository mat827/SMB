# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end


  # お問い合わせ機能と関連付け
  has_many :contact, dependent: :destroy

  # お気に入り機能と関連付け
  has_many :favorites, -> { order(position: :asc) }
  has_many :stretchs, dependent: :destroy

  # 口コミ投稿との関連付け
  has_many :reviews, dependent: :destroy

  # ログイン時に退会済みのユーザーが入れなくする
  enum is_valid: { 無効: false, 有効: true }
  def active_for_authentication? # ログインさせたくないユーザー
    super && (is_valid == '有効') # super=true(親クラスを呼び出している)
  end

  def show_validation
    if is_valid == '無効'
      '退会済'
    else
      '有効'
    end
  end

  # 検索機能(会員検索)
  def self.search(str)
    return all unless str

    where(['family_name LIKE ?', "%#{str}%"]).or(where(['first_name LIKE ?', "%#{str}%"])).
      or(where(['family_name_yomi LIKE ?', "%#{str}%"])).
      or(where(['first_name_yomi LIKE ?', "%#{str}%"]))
  end
end
