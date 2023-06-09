class UsersController < ApplicationController

    def index
       @users = User.all
    end

    def new 
       @user = User.new
    end

    def show
       @user = User.find(params[:id]) 
    end

    def create 
       @user = User.create(user_params)
       if @user.save
        redirect_to @user
       else
        render :new
       end 
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: { success: true }
        else
            render json: { success: false, errors: @user.errors.full_messages }
        end
    end

    def destroy
       @user = User.find(params[:id])
        if @user.destroy
          redirect_to @user
        end 
    end 

    private 

    def user_params 
       params.require(:user).permit(:city, :name, :contact)
    end 

end
