window.Application = {} # Application namespace

$ ->
  $('.tooltip').tooltipster
    theme: 'tooltipster-shadow'

  $('.tip-card button').click ->
    $(@).closest('.mdl-card').fadeOut().hide('slow')
