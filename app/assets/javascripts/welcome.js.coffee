# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#ready se ejeecuta cuando por primera vez visitamos la pagina
#page:load se ejeecuta cuando se cambia pagina
$(document).on "ready page:load", ()->
	$.material.init()
	$(".close-parent").on "click",()->
		$(this).parent().slideUp()