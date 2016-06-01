$(window).resize ->
  resizeMain()

resizeMain = ->
  $('main').height $(window).height() - $('header').height() - 1
  return

$ ->
  resizeMain()
  return
