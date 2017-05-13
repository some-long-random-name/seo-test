class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true

  scope :sorted, -> { order :title }
end
