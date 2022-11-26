class SubsController < ApplicationController

    before_action :check_mod, only: [:edit]

    def index
        @subs = Sub.all
    end

    def edit
        @sub = Sub.new
        render :edit
    end

    def show

    end

    def update

    end

    def check_mod(user)
        @sub = Sub.find_by(id: params[:id])
        user.id == @sub.moderator_id
    end

end