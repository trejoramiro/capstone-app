class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :current_user

    after_filter :set_csrf_cookie_for_ng

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate_user!
        redirect_to '/login' unless current_user
    end

    def authenticate_admin!
        redirect_to '/' unless current_user && current_user.admin
    end

    protected

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end
end
