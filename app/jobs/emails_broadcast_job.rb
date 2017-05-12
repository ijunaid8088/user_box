class EmailsBroadcastJob < ApplicationJob
    queue_as :default

    def perform(email)

      ActionCable.server.broadcast "emails_#{email.recipient_id}_channel",
                             email: render_notification(email)
                                   
    end

    private

    def render_notification(email)
      ApplicationController.renderer.render partial: 'shared/notification', locals: {email: email}
    end

   
  end