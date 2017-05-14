class Admin::LinkGroupsController < ApplicationController
  before_action :find_page
  before_action :find_link_group, only: %w(edit update destroy)

  def new
    @link_group = LinkGroup.new
  end

  def create
    @link_group = LinkGroup.new link_group_params

    if @link_group.save
      redirect_to admin_page_path(@link_group.page)
    else
      flash[:errors] = @link_group.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @link_group.update link_group_params
      redirect_to [:admin, @page]
    else
      flash[:errors] = @link_group.errors.full_messages
      render :edit
    end
  end

  def destroy
    @link_group.destroy
    redirect_to [:admin, @page]
  end

  private

  def find_page
    @page = Page.find params[:page_id]
  end

  def find_link_group
    @link_group = @page.link_groups.find params[:id]
  end

  def link_group_params
    params.require(:link_group).permit(:title).merge(page: @page)
  end
end
