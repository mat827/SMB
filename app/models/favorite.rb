# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stretch
  acts_as_list scope: :user
end
