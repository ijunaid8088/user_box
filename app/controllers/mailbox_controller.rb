class MailboxController < ApplicationController

  def index
    @users = User.all
  end
end