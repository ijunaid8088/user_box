class MailboxController < ApplicationController

  def index
    @emails = Email.where(state: 1, recipient_id: current_user.id)
    @current_company = current_user.company_id
    # all_users = User.where(company_id: curren_company)
    @email_users = User.where(company_id: @current_company).to_json()
  end

  def sent
    @emails = Email.where(sender_id: current_user.id)
    curren_company = current_user.company_id
  end

  def delete
    @emails = Email.where(state: 0, sender_id: current_user.id)
    curren_company = current_user.company_id
  end

  def draft
    @emails = Email.where(state: 2, sender_id: current_user.id)
    curren_company = current_user.company_id
  end
end