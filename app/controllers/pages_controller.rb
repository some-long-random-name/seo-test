class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end
end
