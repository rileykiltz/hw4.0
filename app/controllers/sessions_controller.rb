class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params["email"])

    if @user
      if @user.authenticate(params["password"])
        # login the user
        session[:user_id] = @user.id
        redirect_to "/companies"
      else
        # Incorrect password
        redirect_to "/sessions/new", alert: "Invalid email or password"
      end
    else
      # Email not found
      redirect_to "/sessions/new", alert: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end
end
