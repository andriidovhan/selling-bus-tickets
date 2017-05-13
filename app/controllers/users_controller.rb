class UsersController < ApplicationController
  layout false

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def delete
    destroy
    # @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
