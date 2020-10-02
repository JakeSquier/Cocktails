class UsersController < ApplicationController
    before_action :authenticated?, only: [:show]

    def show
        @user = User.find(params[:id])
    end 

    def authenticated?
        if session[:id] != nil
            @user = User.find(session[:id]) 
        else
            redirect_to '/sign_in'
        end
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        #validate
        if !@user.valid?
            redirect_to new_user_path(@user)
        end 
        @user.save
        byebug
        redirect_to user_path(@user)
    end 

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password)
    end 
end
