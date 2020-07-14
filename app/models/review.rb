# frozen_string_literal: true

class Review < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user

  # ストレッチとの関連付け
  belongs_to :stretch

  validates :title, presence: true, length: { maximum: 50 }
  validates :rate, presence: true
  validates :rate, numericality: {
    # only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }
  # validates :content, presence: true
  validates :content, length: { maximum: 300 }
  validates :user_id, uniqueness: { scope: [:stretch_id] }
end
