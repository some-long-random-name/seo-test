class SearchesController < ApplicationController
  def show
    @query = params[:query]
  end
end
