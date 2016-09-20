class SearchService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com")
  end

  def find_stores(zip, distance = 25)
    response = connection.get do |req|
      req.url "/v1/stores(area(#{zip},#{distance}))"
      req.params['apiKey'] = ENV["BEST_BUY_KEY"]
      req.params['format'] = "json"
      req.params['show'] = "longName,city,distance,phone,storeType,storeId"
    end
    binding.pry
    parsed = parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
  end
end
