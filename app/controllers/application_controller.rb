class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user, :wrong_page

    def current_user
        @user = User.find_by_id(session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def home
        render '/home'
    end

    def wrong_page
        render '/wrong_page'
    end

end
