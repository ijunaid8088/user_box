jQuery(document).on 'turbolinks:load', ->
    App.emails = App.cable.subscriptions.create {
        channel: "EmailsChannel"
        current_id: $('#current').data('current-user')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#messages-box').append data['email']
        console.log(data['email'])

      send_message: (from,to,subject,text) ->
        @perform 'send_message',from: from ,to: to,  subject: subject, text: text



onComposeEmail = ->
  $("#compose-email").on "click", ->
    $("#modal-add-email").modal("show")

onLoadEven = ->
  $.each users, (i, user) ->
    $("#all-to-email").append(
      "<option value='#{user.id}'>#{user.firstname} (#{user.email})</option>"
    )
  email_to_select = $('#all-to-email').select2
    placeholder: 'To',
    allowClear: true

  $.each users, (i, user) ->
    $("#all-cc-email").append(
      "<option value='#{user.id}'>#{user.firstname} (#{user.email})</option>"
    )
  email_cc_select = $('#all-cc-email').select2
    placeholder: 'Cc',
    allowClear: true

  $.each users, (i, user) ->
    $("#all-bcc-email").append(
      "<option value='#{user.id}'>#{user.firstname} (#{user.email})</option>"
    )
  email_bcc_select = $('#all-bcc-email').select2
    placeholder: 'BCc',
    allowClear: true

onSendEmail = ->
  $("#send-email").on "click", ->
    from = $('#current').data('current-user')
    to = $("#all-to-email").val()
    cc = $("#all-cc-email").val()
    bcc = $("#all-bcc-email").val()
    subject = $("#email-subject").val()
    text = $("#email-text").val()

    
    to.forEach (receiver) ->
      App.emails.send_message(from ,receiver, subject, text)

    $("#modal-add-email").modal("hide")
window.initializeInbox = ->
  onSendEmail()
  onComposeEmail()
  onLoadEven()










