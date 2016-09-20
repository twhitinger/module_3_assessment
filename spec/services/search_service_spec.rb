require "rails_helper"
describe SearchService do
  context "#zip" do

    it "returns stores within 25 miles of a given zip" do
      VCR.use_cassette("zip_search") do
        zip = "80202"
        service = SearchService.new
        stores = service.find_stores(zip)


        expect(stores.total).to eq 17
        expect(stores.stores.last.longName).to eq("Best Buy - S.E. Aurora")
        expect(stores.stores.last.city).to eq("Aurora")
        expect(stores.stores.last.phone).to eq("303-693-0166")
        expect(stores.stores.last.distance).to eq(18.51)
        expect(stores.stores.last.storeType).to eq("BigBox")
      end
    end
  end
  context "#id" do
    it "find the store with the given id" do
      VCR.use_cassette("id_search") do
        id = "2740"
        service = SearchService.new
        store = service.find_store(id)

        # I should see the store name, store type and address with city, state and zip
        expect(store.total).to eq 1
        expect(store.stores.first.longName).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
        expect(store.stores.first.address).to eq("3000 East First Ave")
        expect(store.stores.first.city).to eq("Denver")
        expect(store.stores.first.region).to eq("CO")
        expect(store.stores.first.postalCode).to eq("80206")
        expect(store.stores.first.storeType).to eq("Mobile")
      end
    end
  end
end
