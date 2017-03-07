class EmailController < ApplicationController

  def all_users_for_email
    curren_company = current_user.company.id
    # all_users = User.where(company_id: curren_company)
    render json: User.where(company_id: curren_company).to_json()
  end
end