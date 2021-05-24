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

end 