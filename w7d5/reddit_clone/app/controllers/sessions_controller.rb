class SessionsController < ApplicationController

    def new #new_session_url
        user = User.new
        render :new
    end

    def create #session_url
        @user = User.find_by(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to user_url(@user.id)
        else
            render[:errors] = ["Invalid username or password"]
        end
    end

    def destroy #session_url
        logout
        redirect_to new_session_url
    end


end