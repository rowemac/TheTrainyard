class UsersController < ApplicationController

    def new

    end 

    def create

    end 

    def edit

    end

    def update

    end

    def show
        @user = User.find_by_id(params[:id])
    end 

    def destroy

    end 

end