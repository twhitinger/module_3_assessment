require "rails_helper"

RSpec.feature "user can find stores by zip code" do
  describe "user enters a valid zip" do
    scenario "they see a list of 15 stores within 25 mile radius" do
      VCR.use_cassette("zip_feature") do
        visit "/"
  # And I fill in a search box with "80202" and click "search"
        fill_in "zip", with: "80202"
        click_on "Search"
  # Then my current path should be "/search" (ignoring params)
        expect(current_path).to eq "/search"
  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "17 Total Stores"
        expect(page).to have_content "17 Total Stores"
  # And I should see exactly 15 results
        within ".results" do
          expect(page).to have_selector('.store', count: 15)
        end
  # And I should see the long name, city, distance, phone number and store type for each of the 15 results

          expect(page).to have_content "Name"
          expect(page).to have_content "City"
          expect(page).to have_content "Distance"
          expect(page).to have_content "Phone Number"
          expect(page).to have_content "Store Type"
      end
    end
  end
end
