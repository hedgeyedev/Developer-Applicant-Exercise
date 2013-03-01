jQuery ->
	try
		$('.alert').animate
			opacity: 0, 5000, ->
				$(this).hide()
			
