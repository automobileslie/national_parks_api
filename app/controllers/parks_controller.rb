class ParksController < ApplicationController

    def by_state
        require 'rest_client'  
        code= params[:stateCode]  
        address= "https://developer.nps.gov/api/v1/parks?&API_KEY=#{ENV['NPS_API_KEY']}&stateCode="
        complete_address=address+code
        nps_data= RestClient.get(complete_address)
        nps_parsed= JSON.parse(nps_data)
        render json: nps_parsed
    end

    def by_search
        require 'rest_client'  
        query= params[:query]  
        address= "https://developer.nps.gov/api/v1/parks?&API_KEY=#{ENV['NPS_API_KEY']}&q="
        complete_search_address=address+query
        nps_data= RestClient.get(complete_search_address)
        nps_search_parsed= JSON.parse(nps_data)
        render json: nps_search_parsed
    end

    
end


