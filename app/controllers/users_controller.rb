class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.password = BCrypt::Password.create(params[:password])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
