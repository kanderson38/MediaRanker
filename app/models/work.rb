class Work < ApplicationRecord
  validates :title, :creator, :category, presence: true
end
