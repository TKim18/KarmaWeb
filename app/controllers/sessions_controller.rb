class SessionsController < ApplicationController
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        circle = User.findCircle(user.id)
        if circle == false
			redirect_to circles_path
		else
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
