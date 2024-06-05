class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && BCrypt::Password.new(@user.password) == params[:password]
      flash[:notice] = "You've logged in."
      redirect_to companies_path
    else
      flash[:notice] = "Unsuccessful login."
      redirect_to new_session_path
    end
  end
end
