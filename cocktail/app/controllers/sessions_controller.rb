class SessionsController < ApplicationController

    def sign_up

    end

    def sign_in
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            byebug
            redirect_to "/users/#{session[:id]}"
        else
            flash[:error] = "Incorrect Email or Password"
            redirect_to '/sign_in'
        end
    end
    
end
