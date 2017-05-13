class LinkGroup < ApplicationRecord
  belongs_to :page

  validates :page, presence: true
  validates :title, presence: true
end
