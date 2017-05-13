class Link < ApplicationRecord
  belongs_to :link_group
  belongs_to :page

  validates :link_group, presence: true
  validates :page, presence: true
  validates :title, presence: true
  validates :slug, presence: true
end