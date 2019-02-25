class SessionsController < ApplicationController
    skip_before_action :authenticate
    

    def create
      
      @user = User.find_by(user_name: params[:user_name])
      if @user == nil || !@user.authenticate(params[:password])
        flash[:errors] = "Incorrect username/password"
        
      else
        session[:user_id] = @user.id

      end
    
    end

    def destroy
      session.delete(:user_id)
      
    end
  end