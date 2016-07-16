# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(jQuery)
$(->
  $("a.reveal").click(->
    $(this).parents("p").next("div.reveal").show "fast"
    return
  )
  $(".toggle a").click(->
    $(this).parents(".toggle").first().children().toggle(200)
    return
  )
  $(".toggle-two ul li:first-child a").click(->
    $(this).parents("li").first().children().toggle()
    $(this).parents(".toggle-two").first().children("div").first().toggle(200)

    return
  )
  $(".toggle-two ul li:last-child a").click(->
    $(this).parents("li").first().children().toggle()
    $(this).parents(".toggle-two").first().children("div").last().toggle(200)

    return
  )

  return
)