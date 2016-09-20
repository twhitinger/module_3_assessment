require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :request do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get 'api/v1/items'
      # When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items
      expect(response.status).to eq 200

      items = JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
      item = items.first
      name = item.name
      description = item.description
      url = item.image_url
      expect(items.count).to eq 2
      #  And each item has an id, name, description, and image_url but not the created_at or updated_at
      expect(item["name"]).to eq(name)
      expect(item["description"]).to eq(description)
      expect(item["image_url"]).to eq(url)
      expect(item["created_at"]).to eq(nil)
      expect(item["updated_at"]).to eq(nil)
      # When I send a POST request to /api/v1/items with a name, description, and image_url I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

    end
  end

  describe "GET show" do
    it "can get single specified items" do
      item = items(:one)
      id = item.id
      # When I send a GET request to /api/v1/items/1 I receive a 200 JSON

      get "api/v1/items/#{id}"

      expect(response.status).to eq 200
      # response containing the id, name, description, and image_url but not the created_at or updated_at

      item = JSON.parse(response.body)
      expect(item["name"]).to eq "First_Item"
      expect(item["description"]).to eq "First_Description"
      expect(item["image_url"]).to eq "First_image_url"
      expect(item["created_at"]).to eq nil
      expect(item["updated_at"]).to eq nil
    end
  end

  describe "DELETE destroy" do
    it "can delete single specified items" do
      item = items(:one)
      delete "/api/v1/items/1"
      # When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted

      expect(response.status).to eq 204
    end
  end

  describe "POST create" do
    it "can create a new item" do
      # When I send a POST request to /api/v1/items with a name, description, and image_url I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
      name = "muck"
      description = "luck"
      image_url = "new_image"

      params = {
        name: name,
        description: description,
        image_url: image_url
      }

      post "/api/v1/items", params

      expect(response.status).to eq 201

      item = JSON.parse(response.body)

      expect(item["name"]).to eq name
      expect(item["description"]).to eq description
      expect(item["image_url"]).to eq image_url
      expect(item["created_at"]).to eq nil
      expect(item["updated_at"]).to eq nil
    end
  end


end
