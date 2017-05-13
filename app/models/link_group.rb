class LinkGroup < ApplicationRecord
  belongs_to :page
  has_many :links

  validates :page, presence: true
  validates :title, presence: true
end
