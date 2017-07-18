module Api::V1
  class ListsController < ApiController

    def index
         user = User.find(params[:user_id])
         list = List.all
         render json: user.lists # each_serializer: ListSerializer
    end

    def show
      render json: List.find(params[:id])
    end

  end
end
