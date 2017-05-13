class Admin::PagesController < ApplicationController
  before_action :fetch_pages, only: :index
  before_action :fetch_page, only: %w(edit update destroy)

  def index
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      redirect_to admin_pages_path
    else
      fetch_pages
      render :index
    end
  end

  def edit
  end

  def update
    if @page.update page_params
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path
  end

  private

  def fetch_pages
    @pages = Page.sorted
  end

  def fetch_page
    @page = Page.find params[:id]
  end

  def page_params
    params.require(:page).permit(:title, :slug)
  end
end
