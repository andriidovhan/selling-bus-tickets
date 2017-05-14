class AccessController < ApplicationController

  layout 'custom'

  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :disable_navigation

  def login
    render 'login'
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to timetables_url, notice: "You are now logged in."
      else
        flash.now[:notice] = "Invalid username/password combination."
        render('login')
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(access_login_path)
  end

  private

  def disable_navigation
    @disable_navigation = true
  end
end
