class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]
    # before_action :set_concert, only: [:new, :create, :edit, :update, :show]

    def new
    end 

    def create
    end

    def edit
    end

    def update
    end 

    def show
    end

    def destroy
    end

    private

    def ticket_params
        params.require(:ticket).permit(:confirmation, :quantity)
    end

    def set_concert
        @concert = Concert.find_by_id(params[:id])
    end 

    def find_ticket
        @ticket = Ticket.find_by_id(params[:id])
    end

end