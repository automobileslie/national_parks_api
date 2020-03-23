class ParkCollectionsController < ApplicationController

def index
    parkCollections=ParkCollection.all
    render json: parkCollections, include: ['notes']
end

def show
    parkCollection=ParkCollection.find_by(params[:id])
    render json: parkCollection, include: :notes
end


def create
    parkCollection=ParkCollection.create(parkCollection_params)

    if parkCollection.valid?
        render json: ParkCollection.all
    else 
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
end

def update
    parkCollection=ParkCollection.find(params[:id])
    parkCollection.update(parkCollection_params)
    render json: ParkCollection.all
end

def destroy
    parkCollection=ParkCollection.find(params[:id])
    parkCollection.destroy
    parkCollections=ParkCollection.all
    render json: parkCollections
end


def parkCollection_params
    params.permit(:user_id, :park_id, :description, :directions_url, :url, :full_name)
end

end
