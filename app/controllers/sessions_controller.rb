class SessionsController < ApplicationController
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        circleName = User.findCircleName(user.id)
        # Check that they have all their information

        # if user.email == null
        #     redirect_to users_fix_path
        # Check that they are in a circle

        if user.homeLocation == nil
        # if circleName == '-1'
			redirect_to onboarding_user_path(user)       
        # redirect to their orders page
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
