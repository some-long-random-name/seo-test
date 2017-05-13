require 'search_engine'

class SearchesController < ApplicationController
  def show
    @query = params[:query]
    @search = SearchEngine.new @query
  end
end
