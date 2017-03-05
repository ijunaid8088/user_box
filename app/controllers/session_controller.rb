class SessionController < ApplicationController

  def create
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
          redirect_to '/mail_box', :success => "Welcome to MailBox."
        end
      else
        redirect_to root_path, :danger => "Username or Password was wrong."
      end
    end
  end

  def save_password
    current_user.actual_password = params[:password]
    current_user.password = params[:password]
    current_user.is_first_login = false
    if current_user.save
      redirect_to '/mail_box', :success => "Welcome to MailBox."
    else
      redirect_to "/first_sign_in" , :danger => "#{current_user.errors.full_messages.first}"
    end
  end
end
