class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item
      item.destroy
      render json: {}, status: 204
    else
      render "No items match"
    end
  end

  def create
    item = Item.create(name: params["name"], description: params["description"], image_url: params["image_url"])
    render json: item, status: 201
  end
end
