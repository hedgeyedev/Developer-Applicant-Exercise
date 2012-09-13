$(document).ready(function(){
	var container = $("#tweets");
	
	//compiled dust template
	/*Source:
		<div class="tweet">
			<img src="{imageURL}"/>
			<a href="http://twitter.com/{userName}" class="name">
				{name}
			</a>
			<div class="created">
				{created}
			</div>
			<div class="text">
				{text}
			</div>
			<div class="source">
				via {source}
			</div>
		</div>
	*/
	(function() {
		dust.register("tweet", body_0);
		function body_0(chk, ctx) {
			return chk.write("<div class=\"tweet\"><img src=\"").reference(ctx.get("imageURL"), ctx, "h").write("\"/><a href=\"http://twitter.com/").reference(ctx.get("userName"), ctx, "h").write("\" class=\"name\">").reference(ctx.get("name"), ctx, "h").write("</a><div class=\"created\">").reference(ctx.get("created"), ctx, "h").write("</div><div class=\"text\">").reference(ctx.get("text"), ctx, "h").write("</div><div class=\"source\">via ").reference(ctx.get("source"), ctx, "h").write("</div></div>");
		}
		return body_0;
	})();
	
	$.get("/public_timeline", function(data) {
		for(var i = 0, len = data.length; i < len; i++) {
			dust.render("tweet", data[i], function(err, out) {
				container.append(out);
			});
		}
	});
	
});