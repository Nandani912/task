class UsersController < ApplicationController
#  skip_before_action :authorize, only :[:new, :create] 

  def new
   @user = User.new
  end
  def create
   @user = User.new(user_params)
    if @user.save 
     redirect_to login_path,notice: "User created successfully"
    else
      render :new
      flash.now[:error] = @user.errors.full_messages.to_sentence
    end
  end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  end