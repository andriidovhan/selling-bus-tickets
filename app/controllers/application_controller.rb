class ApplicationController < ActionController::Base

  before_action :confirmed_logged_in

  protect_from_forgery with: :exception

  private

  def confirmed_logged_in
    unless session[:user_id]
      redirect_to  access_login_path, notice: "Please log in."
    end
  end

  def check_admin_role
    @check_admin_role = User.find(session[:user_id]).admin
  end
end


