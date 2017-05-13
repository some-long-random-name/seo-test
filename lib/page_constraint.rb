class PageConstraint
  def matches?(request)
    Page.where(slug: request[:slug]).any?
  end
end
