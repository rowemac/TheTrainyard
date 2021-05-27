class ConcertsController < ApplicationController

    def index
        @concerts = Concert.all
    end 

    def show
        @concert = Concert.find_by_id(params[:id])
    end

    def early
        @concerts = Concert.early_concerts
    end

    def search
        if params[:search].blank?  
            redirect_to(concerts_path, alert: "You didn't search anything!") and return  
        else  
            parameter = params[:search].downcase.strip  
            @results = Concert.search_headliner(parameter) 
        end
    end 

end 