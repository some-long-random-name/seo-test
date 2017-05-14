class Admin::LinksController < ApplicationController
  before_action :find_page
  before_action :find_link, only: %w(edit update destroy)

  def new
    @page = Page.find params[:page_id]
    @link = Link.new link_group_id: params[:link_group_id]
  end

  def create
    @link = Link.new link_params

    if @link.save
      redirect_to [:admin, @page]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update link_params
      redirect_to [:admin, @page]
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to [:admin, @page]
  end

  private

  def find_page
    @page = Page.find params[:page_id]
  end

  def find_link
    @link = @page.links.find params[:id]
  end

  def link_params
    params
      .require(:link)
      .permit(:title, :slug, :search_query, :link_group_id, :description)
      .merge(page_id: @page.id)
  end
end
