class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:show, :edit, :update, :destroy]

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
        if @user
            edit_user_path(@user)
        else
            redirect_to '/wrong_page'
        end
    end

    def update
        @user.update(user_params)
        flash[:notice] = "Profile successfully updated."
        redirect_to user_path(@user)
    end

    def show
        if @user
            user_path(@user)
        else
            redirect_to '/wrong_page' 
        end 
    end 

    def destroy
        @user.destroy
        flash[:notice] = "Profile successfully deleted."
        redirect_to '/'
    end


    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end 
end