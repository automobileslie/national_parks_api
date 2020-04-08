class ParkCollectionsController < ApplicationController

def index
    if valid_token_exists
    parkCollections=ParkCollection.all
    render json: parkCollections, include: ['notes']
    else render json: { errors: "go away" }, status: :unauthorized
end
end

def show
    park_collection=ParkCollection.find(params[:id])
    if logged_in_user_id===park_collection.user_id
    render json: park_collection, include: :notes
    else render json: { errors: "go away" }, status: :unauthorized
    end
end


def create

    if logged_in_user_id===(params[:user_id]) 
        park_collection=ParkCollection.create(parkCollection_params)
        park_collections=ParkCollection.where(user_id: park_collection.user_id)

        render json: park_collections
    else 
        render json: { errors: "go away please" }, status: :unauthorized
    end
end


def destroy

    park_collection=ParkCollection.find(params[:id])

    if park_collection.user_id===logged_in_user_id
    park_collection.destroy
    park_collections=ParkCollection.where(user_id: park_collection.user_id)
    render json: park_collections
    else render json: {errors: "go away"}, status: :unauthorized
end
end


def parkCollection_params
    params.permit(:user_id, :park_id, :description, :directions_url, :url, :full_name)
end

end
