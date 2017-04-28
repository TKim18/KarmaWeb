class UsersController < ApplicationController
  before_action :set_user, only: [:onboarding, :update]

  def index
    @users = User.all
  end

  def onboarding
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to circles_path
    else
      redirect_to onboarding_user_path(@user)
    end
  end
  # def fix
  #   @user = User.find_by id: session[:user_id]

  # end

  private
    def user_params
      params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at, :email, :fullName, :karmaPoints, :circleName, :homeLocation, :circle_id)
    end

    def set_user
      @user = User.find_by id: session[:user_id]
    end
end
