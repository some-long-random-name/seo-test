require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validation' do
    it 'valid with default factory' do
      link = build :link
      expect(link).to be_valid
    end

    it 'invalid without title' do
      link = build :link, title: ''
      expect(link).not_to be_valid
    end

    it 'invalid without slug' do
      link = build :link, slug: ''
      expect(link).not_to be_valid
    end

    it 'invalid without search query' do
      link = build :link, search_query: ''
      expect(link).not_to be_valid
    end

    it 'invalid without page' do
      link = build :link, page: nil
      expect(link).not_to be_valid
    end

    it 'invalid without link_group' do
      link = build :link, link_group: nil
      expect(link).not_to be_valid
    end
  end
end
