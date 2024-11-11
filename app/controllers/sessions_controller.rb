class SessionsController < ApplicationController
  def new 
    if @user
      redirect_to tasks_path
  end 
  def create
     @user = User.find_by(email: params[:email])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
          redirect_to tasks_path(@user.id),notice: 'Logged in successfully.'
       else
         flash[:alert] = 'Invalid email or password'
         redirect_to '/login'
       end
   end
 
   def destroy
     session[:user_id] = nil
     flash[:notice]="logged out"
     redirect_to "/login"
   end
end
end
