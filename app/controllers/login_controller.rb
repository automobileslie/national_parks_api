class LoginController < ApplicationController

    def create
        user=User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: { token: create_token(user), id: user.id }
        else 
            render json: { errors: "Your username or password is incorrect." }, status: :unprocessable_entity
          end 

    end


end