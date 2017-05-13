class LinkGroup < ApplicationRecord
  belongs_to :page
  has_many :links, -> { sorted }

  validates :page, presence: true
  validates :title, presence: true

  scope :sorted, -> { order :title }
end
