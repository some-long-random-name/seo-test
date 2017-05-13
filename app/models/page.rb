class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true

  scope :sorted, -> { order :title }

  has_many :link_groups, dependent: :destroy
  has_many :links
end
