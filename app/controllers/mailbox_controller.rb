class MailboxController < ApplicationController

  def index
    @emails = Email.where(state: 1)
    curren_company = current_user.company.id
    # all_users = User.where(company_id: curren_company)
    @email_users = User.where(company_id: curren_company).to_json()
  end
end