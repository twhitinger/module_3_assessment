class SearchController < ApplicationController
  def index
    service = SearchService.new
    @stores = service.find_stores(params["zip"])
  end

  def show

  end
end
