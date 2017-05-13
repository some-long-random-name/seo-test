class LinkConstraint
  def matches?(request)
    page = Page.find_by slug: request[:page_slug]
    page && page.links.where(slug: request[:link_slug]).any?
  end
end
