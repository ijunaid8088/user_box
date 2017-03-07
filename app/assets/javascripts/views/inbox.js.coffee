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
    getEmailUsers()
    $("#modal-add-email").modal("show")

getEmailUsers = ->
  onError = (jqXHR, status, error) ->
    true

  onSuccess = (users, status, jqXHR) ->
    $.each users, (i, user) ->
      # getGravatar(null, user.email)
      $("#all-user-email").append(
        "<option value='#{user.email}'>#{user.firstname} (#{user.email})</option>"
      )
    email_users_select = $('#all-user-email').select2
      placeholder: 'To',
      allowClear: true,
    email_users_select.val("").trigger("change")

  settings =
    cache: false
    data: {}
    dataType: 'json'
    error: onError
    success: onSuccess
    type: 'GET'
    url: "/all_mail_users"
  jQuery.ajax(settings)

window.initializeInbox = ->
  initializeDataTable()
  onComposeEmail()
  console.log "hello"