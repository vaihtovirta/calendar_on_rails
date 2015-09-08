class window.CalendarManager
  constructor: () ->
    @eventForm = $('#event--form')
    @calendar = $('#calendar')
    @formMessages = $('.form__messages')

  onError: (partial)->
    @eventForm.replaceWith(partial)

  onSuccessUpdate: (form_partial, messages_partial, path)->
    @eventForm.html(form_partial)
    @eventForm.prepend(messages_partial)
    window.location.href = path

    @formMessages.animate { opacity: 0 }, 2000, ->
      $(this).remove()
