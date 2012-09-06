# myapp.rb
require 'sinatra'
require 'httparty'
require 'json'

class TwitterTimeline
  include HTTParty
  format :json
end

get '/' do
	timeline = TwitterTimeline.get("http://api.twitter.com/1/statuses/public_timeline.json")
	timeline_clean = Array.new
	timeline.each { |entry|
		temp = {}
		temp = [img_url: entry["user"]["profile_image_url"], id: timeline[0]["user"]["id_str"], text: timeline[0]["text"], source: timeline[0]["source"], time: timeline[0]["created_at"]]
	timeline_clean.push(temp)
	}
	timeline_clean.to_json
end

get '/via_js' do
  '<html>
  <head>
  <style type="text/css" media="screen">
		/* reset and basic typography */
		body {
			margin: 0;
			padding: 0;
			font-family: Helvetica, Arial, sans-serif;
		}
		h1, ol#tweets p {
			font-family: Georgia, "Times New Roman", serif;
			font-weight: normal;
		}
		ol {
			margin: 0;
			padding: 0;
			list-style: none outside none;
		}
		
		/* header */
		#header {
			background-color: black;
			margin-bottom: 2em;
		}
		h1 {
			color: white;
			padding: 0.667em 0;
			margin: 0;
			text-align: center;
		}

		/* tweets */
		ol#tweets.loading {
			padding: 6em 0;
		}
		ol#tweets li {
			padding: 1.25em 0;
			border-bottom: 1px solid #e9e9e9;
		}
        ol#tweets li.error {
            margin: 50px 0 30px 0;
            font-family: Georgia, "Times New Roman", serif;
            text-align: center;
            font-size: 1.5em;
        }
		ol#tweets p {
			font-size: 1.5em;
			color: #666;
		}

        ol#tweets p span.time {
            font-size: 0.7em;
			color: #bbb;
		}

		.user img {
			float: right;
			padding: 5px;
			border: 1px solid #e9e9e9;
			margin-right: 20px;
		}
		.user h3 {
			float: right;
			margin: 0 15px 0 0;
			color: #333;
			line-height: 60px;
		}

	</style>
  	<link rel="stylesheet" href="http://tempojs.com/examples/css/grid.css" type="text/css" media="screen">
  <!-- Import Tempo -->
	<script type="text/javascript" src="http://tempojs.com/tempo.min.js"></script>
	
	<!-- This example uses jQuerys ajax() method to retrieve data from Twitter -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>

	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			var twitter = Tempo.prepare(\'tweets\').notify(function(event) {
				if (event.type === TempoEvent.Types.RENDER_STARTING || event.type === TempoEvent.Types.RENDER_COMPLETE) {
					$(\'ol\').toggleClass(\'loading\');
				}
			});
			twitter.starting();
			$.getJSON("http://api.twitter.com/1/statuses/public_timeline.json", function(data) {
				twitter.render(data.results);
			});
		});
	</script>
	</head>
	<body>
	<ol id="tweets">
	<li class="row" data-template style="display: none;">
		<div class="column grid_4 user">
			<img height="48" width="48" alt="{{from_user}}" src="#" data-src="{{profile_image_url}}" />
			<h3>{{from_user}}</h3>
		</div>
		<p class="column grid_8 text">
            {{text | replace \'@([A-z0-9_]+)\', \'@<a href="http://twitter.com/$1">$1</a>\'}}<span class="time">, {{created_at | date \'\at HH:mm on EEEE\' }}</span>
        </p>
	</li>
    <li class="error" data-template-fallback>
        Sorry, but you sort of need JavaScript for this one!
    </li>
</ol>
</body>
</html>
	'
end