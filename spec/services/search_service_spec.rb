require "rails_helper"
describe SearchService do
  context "#zip" do

    it "returns stores within 25 miles of a given zip" do
      VCR.use_cassette("zip_search") do
        zip = "80202"
        service = SearchService.new
        stores = service.find_stores(zip)


        expect(stores.total).to eq 17
        expect(stores.stores.last.longName).to eq("Best Buy - Littleton")
        expect(stores.stores.last.city).to eq("Littleton")
        expect(stores.stores.last.phone).to eq("303-932-7830")
        expect(stores.stores.last.distance).to eq(10.45)
        expect(stores.stores.last.storeType).to eq("BigBox")
      end
    end
  end
end
