class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :family_name_yomi, presence: true
  validates :first_name_yomi, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :phone_number, presence: true
  validates :is_valid, presence: true


# ログイン時に退会済みのユーザーが入れなくする
  enum is_valid: { 無効: false, 有効: true }
  def active_for_authentication?#ログインさせたくないユーザー
    super && (is_valid == '有効') #super=true(親クラスを呼び出している)
  end

  def show_validation
    if is_valid == '無効'
      '退会済'
    else
      '有効'
    end
  end

  #検索機能(会員検索)
  def self.search(str)
    return all unless str
    where(['family_name LIKE ?', "%#{str}%"]).or(where(['first_name LIKE ?', "%#{str}%"])).
      or(where(['family_name_yomi LIKE ?', "%#{str}%"])).
      or(where(['first_name_yomi LIKE ?', "%#{str}%"]))
  end



end
