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
  window_height = $(window).height()
  header_height = $('header').height() + 1
  turn_parts_height = $('.turn_parts').height()
  main_height = window_height - header_height
  player_area_height = (main_height - turn_parts_height) / 2
  $('main').height(main_height)
  $('.player-area').height(player_area_height)
  return

$ ->
  resizeMain()
  return
