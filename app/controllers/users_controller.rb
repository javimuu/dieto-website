class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        if @user
            @is_me = @user.id == current_user.id ? true: false
        end
        
        if !@is_me
            @status =  current_user.status_with @user.id
            @friend =  Friend.where(user_id: current_user.id, friend_id: @user.id).try(:first) ||
                Friend.where(user_id: @user.id, friend_id: current_user.id).try(:first)
        end
    end
end