class EmailController < ApplicationController

  def all_users_for_email
    curren_company = current_user.company.id
    # all_users = User.where(company_id: curren_company)
    render json: User.where(company_id: curren_company).to_json()
  end

  def create
    begin
      @email = Email.new(
        sender_id: params[:sender_id],
        recipient_id: params[:recipient_id],
        body: params[:body],
        subject: params[:subject],
        state: 1,
        cc: params[:cc],
        bcc: params[:bcc],
        attachment: params[:attachment]
      )
      respond_to do |format|
        if @email.save
          format.json { render json: @email.to_json() }
        else
          format.json { render json: @email.errors.full_messages, status: :unprocessable_entity }
        end
      end
    rescue => error
      Rails.logger.error error
      respond_to do |format|
        format.json { render json: error.message, status: :unprocessable_entity }
      end
    end
  end

  def draft
    begin
      @email = Email.new(
        sender_id: params[:sender_id],
        recipient_id: params[:recipient_id],
        body: params[:body],
        subject: params[:subject],
        state: params[:state],
        cc: params[:cc],
        bcc: params[:bcc],
        attachment: params[:attachment]
      )
      respond_to do |format|
        if @email.save
          format.json { render json: @email.to_json() }
        else
          format.json { render json: @email.errors.full_messages, status: :unprocessable_entity }
        end
      end
    rescue => error
      Rails.logger.error error
      respond_to do |format|
        format.json { render json: error.message, status: :unprocessable_entity }
      end
    end
  end
end