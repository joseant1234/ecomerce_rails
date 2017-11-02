$(document).on "ajax:beforeSend", "#emails-form", ()->
	console.log "Se esta enviando el fomulario"
	$("#email-info").html "Se está procesando su peticion"
$(document).on "ajax:success","#emails-form", (e,data,estado,xhr)->
	$(this).slideUp()
	$("#email-info").html "Ya estas en la filas de las abitacioens beta"
$(document).on "ajax:error","#emails-form", (e,data,estado,xhr)->
	$("#email-info").html data.responseJSON.email[0]

