class window.ColorGenerator
  constructor: ->
    @userColorBox = $('.user-color--box')
    @hiddenColorInput = $('.user-color input')

    @setStyles()
    @handleClickBox()

  setStyles: () ->
    if @hiddenColorInput.val() == ''
      @userColorBox.css('backgroundColor', @randomColor)
      @setInput(@userColorBox)
    else
      @userColorBox.css('backgroundColor', @hiddenColorInput.val())

  handleClickBox: () ->
    @userColorBox.click (event) =>
      event.preventDefault()
      target = event.currentTarget
      $(target).css('backgroundColor', @randomColor)
      @setInput($(target))

  setInput: (element) ->
    @hiddenColorInput.val(element.css('backgroundColor'))

  randomColor: () ->
    randomColor()

$ ->
  if $('.user-color--box').length
    new window.ColorGenerator
