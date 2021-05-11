class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]
    # before_action :find_concert, only: [:new, :create, :edit, :update, :show]

    def index
        if params[:concert_id]
            set_concert
            @tickets = @concert.tickets
        else 
            @tickets = Ticket.all
        end
    end

    def show
        if params[:concert_id]
            set_concert
        end 
    end

    
    def new
        if params[:concert_id]
            set_concert
            @ticket = @concert.tickets.build
        else
            @ticket = Ticket.new 
        end
    end 

    def create
        if params[:concert_id]
            set_concert
            @ticket = @concert.tickets.build(ticket_params)
        else
            @ticket = Ticket.new(ticket_params)
        end

        if @ticket.save 
            if @concert
                redirect_to concert_tickets_path(@concert, @ticket)
            else
                redirect_to @ticket
            end
        else
            render :new
        end
    end

    def edit
    end

    def update
    end 

    def destroy
    end

    private

    def ticket_params
        params.require(:ticket).permit(:confirmation, :quantity, :concert_id)
    end

    def set_concert
        @concert = Concert.find_by_id(params[:concert_id])
    end 

    def find_ticket
        @ticket = Ticket.find_by_id(params[:id])
    end

end