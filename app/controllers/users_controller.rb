class UsersController < ApplicationController

    def show
        user_id = params[:id]
        user = User.find(user_id)
        if logged_in_user_id===user_id.to_i
          render json: user, include: :park_collections
        else
          render json: { go_away: true }, status: :unauthorized
        end
    end

    def create
        user = User.create(user_params)
        if user.valid?
          render json: { message: "Your account has been created! Now you can log in." } 
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end  
    end

    def destroy
      if valid_token_exists
      user=User.find(params[:id])
        user.destroy
        render json: {message: "Your account has been deleted."}
      else render json: {errors: user.errors.full_messages}, status: :unauthorized
    end    
    end

    def user_params
        params.permit(:username, :password)
    end

end
