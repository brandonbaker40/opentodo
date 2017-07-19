module Api::V1
  class ItemsController < ApiController
    before_action :authenticate

    def index
        list = List.find(params[:list_id])
        items = list.items
        render json: list.items
    end

    def show
      render json: Item.find(params[:id])
    end

    def create
      list = List.find(params[:list_id])
      item = list.items.new(item_params)
      if item.save
       render json: item
     else
       render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
     end
    end

    def destroy
     begin
       item = Item.find(params[:id])
       item.destroy

       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

    private

    def item_params
      params.require(:item).permit(:description, :completed)
    end

  end
end
