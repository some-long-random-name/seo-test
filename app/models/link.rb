class Link < ApplicationRecord
  before_validation :generate_slug

  belongs_to :link_group
  belongs_to :page

  validates :link_group, presence: true
  validates :page, presence: true
  validates :title, presence: true
  validates :slug, presence: true
  validates :search_query, presence: true

  scope :sorted, -> { order :title }

  private

  def generate_slug
    return if slug.present?
    self.slug = title.parameterize
  end
end
