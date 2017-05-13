class Page < ApplicationRecord
  before_validation :generate_slug

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :sorted, -> { order :title }

  has_many :link_groups, -> { sorted }, dependent: :destroy
  has_many :links

  private

  def generate_slug
    return if slug.present?
    self.slug = title.parameterize
  end
end
