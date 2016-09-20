class ItemSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url, :id
end
