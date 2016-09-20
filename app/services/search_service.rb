class SearchService
  attr_reader :connection
  
  def intialize
    @connection = Faraday.new("https://api.bestbuy.com")
  end

  def get_stores(zip, distance = 25)
  end
end
