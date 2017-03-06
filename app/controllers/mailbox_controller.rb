class MailboxController < ApplicationController

  def index
    @emails = Email.all
  end
end