class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find_by slug: params[:slug]
    @link_groups = @page.link_groups.includes(:links)
  end
end
