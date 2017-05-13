require 'rails_helper'

describe 'routes for pages controller' do
  let(:page) { create :page, slug: 'foo' }
  before { create :link, page: page, slug: 'bar' }

  it 'have route for /foo/bar' do
    expect(get: '/foo/bar').to be_routable
  end

  it 'does not route for /foo/missing' do
    expect(get: '/foo/missing').not_to be_routable
  end

  it 'route to right controller' do
    expected = {
      controller: 'links',
      action: 'show',
      page_slug: 'foo',
      link_slug: 'bar'
    }

    expect(get: '/foo/bar').to route_to(expected)
  end
end
