class UsersController < ApplicationController
  # Actions for Bcrypt
  def new
  end

  # createas a new user,stores session ID to user.
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
