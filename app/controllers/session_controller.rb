class SessionController < ApplicationController

  def create
    pry
    @user = User.find_by_email(params[:email])
    unless @user.present?
      redirect_to root_path, :danger => "Username or Password was wrong."
    else
      user_hash = BCrypt::Password.new(@user.password)
      if @user && user_hash == params[:password]
        session[:user_id] = @user.id
        if @user.is_first_login
          redirect_to "/first_sign_in"
        else
          redirect_to dashboard_path
        end
      else
        redirect_to root_path
      end
    end
  end
end
