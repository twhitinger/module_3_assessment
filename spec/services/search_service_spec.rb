require "rails_helper"
describe SearchService do
  context "#zip" do

    it "returns stores within 25 miles of a given zip" do
      VCR.use_cassette("zip_search") do
        zip = "80202"
        stores = SearchService.new.get_stores(zip)

        expect(stores["total"]).to eq 17
        expect(stores["stores"].first["longName"]).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
        expect(stores["stores"].first["city"]).to eq "Denver"
        expect(stores["stores"].first["phone"]).to eq "303-270-9189"
        expect(stores["stores"].first["distance"]).to eq 3.25
        expect(stores["stores"].first["storeType"]).to eq "Mobile"
      end
    end
  end
