class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
