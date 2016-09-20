class SearchController < ApplicationController
  def index
    service = SearchService.new
    @stores = service.find_stores(params["zip"])
  end

  def show
    service = SearchService.new
    @store = service.find_store(params[:id]).stores.first
  end
end
