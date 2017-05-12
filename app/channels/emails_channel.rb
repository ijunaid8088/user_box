class EmailsChannel < ApplicationCable::Channel

  def subscribed
    stream_from("emails_#{params['current_id']}_channel")
    
  end

  def unsubscribed
  end

  def send_message(data)
    @email = Email.create!(sender_id: data['from'],recipient_id: data['to'],body: data['text'],subject: data['subject'],state: '1')
  end
end