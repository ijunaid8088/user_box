class MailboxController < ApplicationController

  def index
    @emails = Email.where(state: 1)
  end
end