class StretchImage < ApplicationRecord
  belongs_to :stretch
  attachment :image
end
