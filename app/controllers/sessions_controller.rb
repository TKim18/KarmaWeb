class SessionsController < ApplicationController
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        circleName = User.findCircleName(user.id)
        # Otherwise, redirect to circles_path
        if circleName == '-1'
			redirect_to circles_path         
        # In the case they do have a circle, redirect to their orders page
		else
            @circle = Circle.find_by name: circleName
            redirect_to circle_orders_path(@circle)
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
