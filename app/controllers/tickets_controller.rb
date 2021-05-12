class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]

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
            redirect_to concert_path(@concert)
        end
    end

    def create
        if params[:concert_id]
            set_concert
            @ticket = @concert.tickets.build(ticket_params)
        else
            redirect_to concert_path(@concert)
        end

        @ticket.user_id = session[:user_id]

        if @ticket.save 
            if @concert
                redirect_to concert_ticket_path(@concert, @ticket)
            else
                redirect_to concert_ticket_path(@ticket)
            end 
        else
            render :new
        end
    end

    def edit
    end

    def update
        if params[:concert_id]
            set_concert
            @ticket = @concert.tickets.build(ticket_params)
        else
            redirect_to concert_path(@concert)
        end

        @ticket.user_id = session[:user_id]

        if @ticket.update(ticket_params)
            if @concert
                redirect_to concert_ticket_path(@concert, @ticket)
            else
                redirect_to concert_ticket_path(@ticket)
            end
        else 
            render :edit
        end 
    end 

    def destroy
        @ticket.destroy
        redirect_to concert_path(current_user)
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