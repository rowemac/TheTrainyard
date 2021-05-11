class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]
    before_action :find_concert, only: [:new, :create, :edit, :update, :show]

    def new
    end 

    def create
        @ticket = Ticket.new(user_params)
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else
            redirect_to new_ticket_concert_path
        end 
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

    def find_concert
        @concert = Concert.find_by_id(params[:concert_id])
    end 

    def find_ticket
        @ticket = Ticket.find_by_id(params[:id])
    end

end