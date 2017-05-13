require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validation' do
    it 'valid with default factory' do
      page = build :page
      expect(page).to be_valid
    end
  end
end
