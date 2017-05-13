class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :sorted, -> { order :title }

  has_many :link_groups, -> { sorted }, dependent: :destroy
  has_many :links
end
