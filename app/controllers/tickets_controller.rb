class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]

    def index
        @tickets = Ticket.all
    end 

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

    def find_ticket
        @ticket = Ticket.find_by_id(params[:id])
    end

end