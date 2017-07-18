module Api::V1
  class ItemsController < ApiController

    def index
        list = List.find(params[:list_id])
        items = list.items
        render json: list.items
    end

    def show
      render json: Item.find(params[:id])
    end

  end
end
