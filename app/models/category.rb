class Category < ApplicationRecord
  has_many :stretchs

  enum is_valid: { 有効: true, 無効: false }

  validates :name, presence: true
end
