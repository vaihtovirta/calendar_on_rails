class window.VexModal
  constructor: () ->
    vex.defaultOptions.className = 'vex-theme-flat-attack'
    @tips = $('#modal-tips')
    @modalOnClick()
    @onSuccessRequest()
    @tipAlert()

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

  tipAlert: () ->
    if @tips.length
      @showModal(@tips.html())

$ ->
  new window.VexModal
