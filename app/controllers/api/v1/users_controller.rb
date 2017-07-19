module Api::V1
  class UsersController < ApiController

    # GET /v1/users
    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
    end

    def create
      user = User.new(user_params)
      if user.save
       render json: user
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
    end

    def destroy
     begin
       user = User.find(params[:id])
       user.destroy
       
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

    def user_params
      params.require(:user).permit(:api_key)
    end

  end
end
