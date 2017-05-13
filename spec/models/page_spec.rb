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

    it 'invalid with same slug' do
      create :page, slug: 'master'
      page = build :page, slug: 'master'
      expect(page).not_to be_valid
    end
  end

  context 'link_groups relation' do
    let(:page) { create :page }
    before { create :link_group, page: page }

    it 'remove all link groups on delete' do
      expect { page.destroy }.to change(LinkGroup, :count).by(-1)
    end
  end
end
