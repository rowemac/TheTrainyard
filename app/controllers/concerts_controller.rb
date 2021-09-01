class ConcertsController < ApplicationController

    def index
        @concerts = Concert.all
    end 

    def show
        if !@concert = Concert.find_by_id(params[:id])
            redirect_to '/wrong_page'
        end
    end

    def early
        @concerts = Concert.early_concerts
    end

    def search
        if params[:search].blank?  
            redirect_to(concerts_path, alert: "You didn't search anything!") and return  
        else  
            parameter = params[:search].downcase.gsub(/\s+/, "")
            @results = Concert.ordered_by_date.select { | concert | concert.headliner.downcase.include?(parameter) }
        end
    end 

    # def popular
    #     @concerts = Concert.popular
    # end

end 