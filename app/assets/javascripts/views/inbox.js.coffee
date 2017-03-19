sendAJAXRequest = (settings) ->
  token = $('meta[name="csrf-token"]')
  if token.size() > 0
    headers =
      "X-CSRF-Token": token.attr("content")
    settings.headers = headers
  xhrRequestChangeMonth = jQuery.ajax(settings)

users_table = undefined

initializeDataTable = ->
  users_table = $("#emails_datatables").DataTable
    aaSorting: [0, "asc"]
    aLengthMenu: [
      [25, 50, 100, 200, -1]
      [25, 50, 100, 200, "All"]
    ]
    columns: [
      {data: "0", sWidth: "105px" },
      {data: "1", sWidth: "300px" },
    ],
    iDisplayLength: 500
    columnDefs: [
      type: "date-uk"
      targets: 'datatable-date'
    ],
    "oLanguage": {
      "sSearch": "Filter:"
    },
    initComplete: ->
      # $("#users_datatables_length").hide()
      # $("#div-dropdown-checklist").css({"visibility": "visible", "width": "57px", "top": "0px", "left": "6px" })
      #do something here

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
    all_to_emails = $("#all-to-email").val()
    cc = $("#all-cc-email").val()
    bcc = $("#all-bcc-email").val()
    console.log all_to_emails

sendToMails = (users, cc, bcc) ->


window.initializeInbox = ->
  initializeDataTable()
  onLoadEven()
  onComposeEmail()
  onSendEmail()
  console.log "hello"
