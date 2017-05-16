class UsersController < ApplicationController

  layout 'custom'

  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to users_path, notice: "The requested user with id: '#{params[:id]}' was not found."
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def delete
    destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :admin, :ticket_id)
  end
end
