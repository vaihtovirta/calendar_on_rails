eventForm = $('#event--form')

<% if event.errors.any? %>
eventForm.replaceWith( "<%= j(render 'users/events/form', event: event)%>" )
<% else %>
eventForm.html("<%= j(render 'users/events/form', event: Event.new(user: current_user))%>")

eventForm.prepend("<%= j render 'users/events/messages' %>")

window.location.href = "<%= j(events_path)%>"

$('.form__messages').animate { opacity: 0 }, 7000, ->
  $(this).remove()
<% end %>

new window.Pickadate
