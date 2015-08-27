eventForm = $('#event--form')

<% if event.errors.any? %>
eventForm.replaceWith( "<%= j(render 'users/events/form', event: event)%>" )
$('body').find('.datepicker').pickadate()
<% else %>
eventForm.html("<%= j(render 'users/events/form', event: event)%>")

eventForm.prepend("<%= j render 'users/events/messages' %>")

window.location.href = "<%= j(events_path)%>"

$('.form__messages').animate { opacity: 0 }, 2000, ->
  $(this).remove()
<% end %>

new window.Pickadate


