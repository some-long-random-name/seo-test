class LinksController < ApplicationController
  before_action :find_page

  def show
    @link = @page.links.find_by slug: params[:link_slug]
  end

  private

  def find_page
    @page = Page.find_by slug: params[:page_slug]
  end
end
