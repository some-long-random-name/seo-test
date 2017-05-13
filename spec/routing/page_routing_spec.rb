require 'rails_helper'

describe 'routes for pages controller' do
  before { create :page, slug: 'foobar' }

  it 'have route for /foobar' do
    expect(get: '/foobar').to be_routable
  end

  it 'does not route for /notfound' do
    expect(get: '/notfound').not_to be_routable
  end

  it 'route to right controller' do
    expected = {
      controller: 'pages',
      action: 'show',
      slug: 'foobar'
    }

    expect(get: '/foobar').to route_to(expected)
  end
end
