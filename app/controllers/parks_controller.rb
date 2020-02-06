class ParksController < ApplicationController

    def index 
        require 'rest_client'  
        number= params[:number]  
        nps_data= RestClient.get("https://developer.nps.gov/api/v1/parks?&API_KEY=#{ENV['NPS_API_KEY']}&start=#{number}&limit=25")
        nps_parsed= JSON.parse(nps_data)
        render json: nps_parsed
    end
    
end


