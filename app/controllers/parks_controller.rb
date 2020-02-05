class ParksController < ApplicationController

    def index 
        require 'rest_client'    
        nps_data= RestClient.get("https://developer.nps.gov/api/v1/parks?&API_KEY=#{ENV['NPS_API_KEY']}")
        nps_parsed= JSON.parse(nps_data)
        render json: nps_parsed
    end
    
end


