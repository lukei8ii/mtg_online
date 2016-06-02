$(window).resize ->
  resizeMain()

$("#my_image").attr("src","second.jpg");

# $(document).on 'click.lightbox.data-api', '[data-toggle*="lightbox"]', (e) ->
#   $this = $(this)
#   href = $this.attr('href')
#
#   $target = $($this.attr('data-target') or href and href.replace(/.*(?=#[^\s]+$)/, ''))
#
#   image_src = $this.find('img').attr('src')
#   $target.find('img').attr('src', image_src)
#
#   $("#my_image").attr("src","second.jpg");
#
#   e.preventDefault()
#   return

$(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
  event.preventDefault()
  $(this).ekkoLightbox()
  return

resizeMain = ->
  header_stuff = $('header').height() + 1
  $('main').height $(window).height() - header_stuff
  return

$ ->
  resizeMain()
  return
