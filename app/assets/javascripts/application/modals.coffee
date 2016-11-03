class window.VexModal
  constructor: () ->
    vex.defaultOptions.className = 'vex-theme-flat-attack'
    @modalOnClick()
    @onSuccessRequest()

  onSuccessRequest: () ->
    $(document).on 'ajax:success',
      'form[data-modal]', (event, data, status, xhr) ->
        url = xhr.getResponseHeader('Location')
        if url
          window.location = url

  showModal: (content) ->
    vex.open
      content: content
      contentCSS:
        width: '27rem'
      $('.vex-overlay').height $(document).height()
      callback: () ->
        vex.dialog.alert
          message: 'Success'

  modalOnClick: () ->
    $('a[data-modal]').on 'click', (event) =>
      event.preventDefault()
      location = $(event.currentTarget).attr('href')
      $.get location, (data) =>
        @showModal(data)
        new window.Pickadate

$ ->
  new window.VexModal
