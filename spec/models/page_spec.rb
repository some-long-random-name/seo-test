require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validation' do
    it 'valid with default factory' do
      page = build :page
      expect(page).to be_valid
    end

    it 'invalid with empty title' do
      page = build :page, title: ''
      expect(page).not_to be_valid
    end

    it 'invalid without slug' do
      page = build :page, slug: ''
      expect(page).not_to be_valid
    end
  end
end
