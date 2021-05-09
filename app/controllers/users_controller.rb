class UsersController < ApplicationController

    before_action :find_user

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to concerts_path
        else
            render :new
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

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end 
end