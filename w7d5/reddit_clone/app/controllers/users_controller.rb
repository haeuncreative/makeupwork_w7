class UsersController < ApplicationController

    before_action :require_logged_in, only: [:show, :index, :destroy]

    def index #users_url
        @users = User.all
        render :index
    end

    def new #new_user_url
        @user = User.new
        render :new
    end

    def create #users_url
        @user = User.new(user_params)
        if @user.save!
            redirect_to user_url(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show #user_url(:id)
        render :show
    end

    def destroy #user_url(:id)
        user = User.find_by(id: user[:id])
        user.delete
        redirect_to new_user_url
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end