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
        $('#messages-box').prepend data['email']
        console.log(data['email'])
        $('#notification').prepend data['notification']

      send_message: (from,to,subject,text) ->
        @perform 'send_message',from: from ,to: to,  subject: subject, text: text


onComposeEmail = ->
  $("#compose-email").on "click", ->
    $("#modal-add-email").modal("show")

onReplyEmail = ->
  $("#b1").on "click", ->
    $("#modal-reply-email").modal("show")
onFarEmail = ->
  $("#b2").on "click", ->
    $("#modal-farword-email").modal("show")

onCloseReply = ->
  $('#closereplybutton').on 'click', (e) ->
    console.log "hi"
    $('#modal-reply-email').modal("hide")

onCloseFar = ->
  $('#closefarbutton').on 'click', (e) ->
    console.log "hi"
    $('#modal-farword-email').modal("hide")

onLoadEven = ->
  $.each users, (i, user) ->
    $("#all-to-email").append(
      "<option value='#{user.id}'>#{user.firstname} (#{user.email})</option>"
    )
  email_to_select = $('#all-to-email').select2
    placeholder: 'To',
    allowClear: true


  val = "Subject: " + $("#subject").data('subject') + "  " + "Content: " + $("#body-content").data('content')

  $("#email-texti").val(val)
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



onReplySendEmail = ->
  $("#reply-email").on "click", ->
    from = $('#current').data('current-user')
    to = $("#sender").data('sender-id')
    cc = $("#all-cc-email").val()
    bcc = $("#all-bcc-email").val()
    sub = $("#subject").data('subject')
    subject = "Replyofyourmail"+sub
    text = $("#email-text").val()

    
    
    App.emails.send_message(from ,to, subject, text)

    $("#modal-reply-email").modal("hide")



onFarSendEmail = ->

    $("#farword-email").on "click", ->
      from = $('#current').data('current-user')
      to = $("#all-to-email").val()
      subject = $("#email-subject").val()
      text = $("#email-texti").val()

      
      to.forEach (receiver) ->
        App.emails.send_message(from ,receiver, subject, text)

      $("#modal-farword-email").modal("hide")
  onModalClose = ->
  $('#closebutton').on 'click', (e) ->
    console.log "hi"
    $('#modal-add-email').modal("hide")
window.initializeInbox = ->
  onSendEmail()
  onComposeEmail()
  onLoadEven()
  onModalClose()
window.initializeInboxi = ->
  onSendEmail()
  onReplyEmail()
  onReplySendEmail()
  onLoadEven()
  onCloseFar()
  onFarEmail()
  onFarSendEmail()
 
  onCloseReply()







