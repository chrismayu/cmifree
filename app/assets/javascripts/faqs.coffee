# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#faqs h4').each ->
    tis = $(this)
    state = false
    answer = tis.next('div').hide().css('height', 'auto').slideUp()
    tis.click ->
      state = !state
      answer.slideToggle state
      tis.toggleClass 'active', state
      return
    return
  return