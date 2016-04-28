# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->  
  $('#question_taking_place').change ->
    if $(this).val() is "At Our Church"
     $('#taking_place_where').show 'slow'
    else
     $('#taking_place_where').hide 'slow'	
    return
  return

$(document).ready ->  
  $('#event_submission_taking_place').change ->
    if $(this).val() is "At Our Church"
     $('#taking_place_where').show 'slow'
    else
     $('#taking_place_where').hide 'slow'	
    return
  return
 
  