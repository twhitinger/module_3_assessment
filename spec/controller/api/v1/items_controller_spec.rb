require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :request do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get 'api/v1/items'
      # When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items
      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      item = items.first
      expect(items.count).to eq 3
      #  And each item has an id, name, description, and image_url but not the created_at or updated_at
      expect(item["name"]).to eq("item_one")
      expect(item["description"]).to eq("description_one")
      expect(item["image_url"]).to eq("image_url_one")
      expect(item["created_at"]).to eq(nil)
      expect(item["updated_at"]).to eq(nil)
      # When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
      # When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted
      # When I send a POST request to /api/v1/items with a name, description, and image_url I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

    end
  end
end
