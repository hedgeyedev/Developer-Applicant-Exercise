(function( $ ){
	
	var ticker = null;
	var tickerStream = null;
	var stocks = [];
	var tickers = null; 
	var scrollRate = 5;
	var tickerSpacing = null;
	var updateStocksInMinutes = 5;
	var url = "http://evening-winter-4582.herokuapp.com/public/v1/stocks?callback=?";
	var defaults = $.extend({
		'backgroundColor' 			: 'white',
		'stockNameColor' 				: '#333333',
		'stockNoChange'					: '#000000',
		'stockUpColor' 					: '#009933',
		'stockDownColor' 				: '#D14836',
		'updateStocksInMinutes' : '60',
		'scrollSpeed' 					: '5',
		'tickerSpacing'					: '12'
	});
	var settings = null;
	
	
	var methods = {
		init : function( options ) { 
			ticker = this;
			settings = $.extend(defaults, options);		
			
			this.css({'background-color'	: settings['backgroundColor']});
			this.css({'color' 					 	: settings['stockNameColor']});
			tickerSpacing 								=	parseInt(settings['tickerSpacing']);
			updateStocksInMinutes 				= parseInt(settings['updateStocksInMinutes']);
			scrollRate										= parseInt(settings['scrollSpeed']);			
			runTicker();
		},
		assignUrl : function(new_url) {
			url = new_url
		}
		// print_settings : function() { 
		// 	console.log(settings['backgroundColor']);
		// 	console.log(settings['stockNameColor']);
		// 	console.log(settings['stockUpColor']);
		// 	console.log(settings['stockDownColor']);
		// 	console.log(settings['updateStocksInMinutes']);
		// 	console.log(settings['scrollSpeed']);
		// }
	};
	
	
	function setColors() {
		$('.no-change').css('color', settings['stockNoChange']);
		$('.positive-change').css('color', settings['stockUpColor']);
		$('.negative-change').css('color', settings['stockDownColor']);
	}

	function resetState() {
		$(".marqueeElement").each(function() {
			$(this).stop();
			$(this).remove();
		})
		stocks = [];
		ticker.empty();
	}
	
	function runTicker() {
		resetState();
		loadTickerData();
		setHoverOver();
		
		setTimeout(runTicker, 1000*60*updateStocksInMinutes);
};
	
	
	function setHoverOver() {
		ticker.hover(function() {
			scrollRate = 0
		}, function() {
			scrollRate = settings['scrollSpeed']
		})
	}
	
	function loadTickerData() {
		t = this
		$.getJSON(url, function(data) {
			$.each(data, function(i, item) {
				stocks.push(item)
				appendTickerStream(item);
				ticker.show();
			});
			setColors();
			startScrolling();
		}).error(function() {
			serverErrorHandling();
		});
		
	};
	
	function serverErrorHandling() {
		ticker.append('Server Error');
		ticker.fadeOut(5000);
	}
	
	function startScrolling() {
		var fullLength = 0;
		$(".marqueeElement").each(function() {
			fullLength += $(this).text().length
		});
		fullLength = fullLength * tickerSpacing
		
		var i = 0;
		$(".marqueeElement").each(function() {			
       var $this = $(this);
			 elementLength = $this.text().length * tickerSpacing 
       $this.css("left", i);
       i += elementLength;
			scrollElement($this, fullLength, elementLength)
    });
	}
	
	function scrollElement(element, fullLength, elementLength) {
		var left = parseInt(element.css("left"));
	 	if(left < -(elementLength)) {
 			left = (fullLength - elementLength);
 			element.css("left", left);
		}
		element.animate({ left: (parseInt(left)-scrollRate) }, 100,'linear', 
			function() {scrollElement($(this), fullLength, elementLength)
		});
	}
	
	function appendTickerStream(stock) {
		var stock_url_and_name = 'href='+ stock.link +' class="marqueeElement" target="_blank">' + stock.name
		var percent_change = parseFloat(stock.ptat_daily_change_in_percent)
		var percent_class = null
		
		if (percent_change == 0) { percent_class = "no-change"}
		else if (percent_change > 0) {percent_class = "positive-change"}
		else {percent_class = "negative-change"}
		var change_spen = '<span class="'+ percent_class +'">('+ percent_change + '%)</span>'
		ticker.append('<a '+ stock_url_and_name + change_spen +'</a>'  )
		
		
		
	}
	$.fn.ticker = function( method ) {		
		
		if ( methods[method] ) {
			return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
		} else if ( typeof method === 'object' || ! method ) {
			return methods.init.apply( this, arguments );
		} else {
			$.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
		}
	};
})( jQuery );