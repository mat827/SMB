# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
