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
  context "#id" do
    it "find the store with the given id" do
      VCR.use_cassette("id_search") do
#         As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
    id = "210"
    service = SearchService.new
    store = service.find_store(id)
# I should see the store name, store type and address with city, state and zip
    expect(store.total).to eq 1
    expect(store.longName).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(store.address).to eq("")
    expect(store.city).to eq("Denver")
    expext(store.region).to eq("CO")
    expect(store.postalCode).to eq("")
    expect(store.storeType).to eq("Mobile")
      end
    end
  end
end
