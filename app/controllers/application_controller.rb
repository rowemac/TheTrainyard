class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?
    helper_method :current_user

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end


    def error_page
        render '/error_page'
    end

end
