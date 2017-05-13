require 'rails_helper'

RSpec.describe LinkGroup, type: :model do
  context 'validation' do
    it 'valid with default factory' do
      link_group = build :link_group
      expect(link_group).to be_valid
    end

    it 'invalid without title' do
      link_group = build :link_group, title: ''
      expect(link_group).not_to be_valid
    end

    it 'invalid without page' do
      link_group = build :link_group, page: nil
      expect(link_group).not_to be_valid
    end
  end
end
