class TicketsController < ApplicationController
    
    before_action :find_ticket, only: [:edit, :update, :show, :destroy]

    def show
        if logged_in?
            if params[:concert_id]
                set_concert
            end 
        else
            redirect_to '/login'
        end 
    end
    
    def new
        if logged_in?
            if params[:concert_id]
                set_concert
                if !@concert.sold_out
                    @ticket = @concert.tickets.build
                else
                    redirect_to '/wrong_page'
                end
            else
                redirect_to concert_path(@concert)
            end
        else 
            redirect_to '/login'
        end 
    end

    def create
        if params[:concert_id]
            set_concert
            @ticket = @concert.tickets.build(ticket_params)
            @ticket.user_id = current_user.id
        else
            redirect_to concert_path(@concert)
        end

        if @ticket.save 
            if @concert
                flash[:notice] = "Thank you for your purchase! Enjoy the show."
                redirect_to concert_ticket_path(@concert, @ticket)
            else
                redirect_to concert_ticket_path(@ticket)
            end 
        else
            render :new
        end
    end

    def edit
        if !logged_in?
            redirect_to '/login'
        end
        set_concert
    end

    def update
        set_concert
        if @ticket.update(ticket_params)
            flash[:notice] = "Order successfully updated."
            redirect_to concert_ticket_path(@concert, @ticket)
        else 
            render :edit
        end 
    end 

    def destroy
        @ticket.destroy
        flash[:notice] = "Ticket refund successful."
        redirect_to user_path(current_user)
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