class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && BCrypt::Password.new(@user.password) == params[:password]
      flash[:notice] = "You've logged in."
      redirect_to companies_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end
