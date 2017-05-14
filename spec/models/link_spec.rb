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

    it 'invalid with wrong slug' do
      ['/abc', '#@', '你好', "a\nb"].each do |slug|
        link = build :link, slug: slug
        expect(link).not_to be_valid
      end
    end
  end

  context 'slug generation' do
    it 'auto generate slug' do
      link = create :link, title: 'Long-long link'
      expect(link.slug).to eq('long-long-link')
    end

    it 'keep custom slug' do
      link = create :link, title: 'Foobar', slug: 'my-description'
      expect(link.slug).to eq('my-description')
    end
  end
end
