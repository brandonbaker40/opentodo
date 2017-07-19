module Api::V1
  class ListsController < ApiController
    before_action :authenticate

    def index
         user = User.find(params[:user_id])
         list = List.all
         render json: user.lists # each_serializer: ListSerializer
    end

    def show
      render json: List.find(params[:id])
    end

    def create
      list = List.new(list_params)
      if list.save
       render json: list
     else
       render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
     end
    end

    def update
      list = List.find(params[:id])
      if list.update(list_params)
        render json: list
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
     begin
       list = List.find(params[:id])
       list.destroy

       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

    private

    def list_params
      params.require(:list).permit(:title, :user_id)
    end

  end
end
