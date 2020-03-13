class ParksController < ApplicationController

    def index 
        require 'rest_client'  
        code= params[:stateCode]  
        address= "https://developer.nps.gov/api/v1/parks?&API_KEY=#{ENV['NPS_API_KEY']}&stateCode="
        complete_address=address+code
        nps_data= RestClient.get(complete_address)
        nps_parsed= JSON.parse(nps_data)
        render json: nps_parsed
    end

    
end


