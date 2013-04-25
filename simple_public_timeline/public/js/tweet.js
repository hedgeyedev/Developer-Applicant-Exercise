// pre-compiled template for tweet.jade
function render_tweet(locals) {
var buf = [];
with (locals || {}) {
buf.push("<article" + (jade.attrs({ 'id':(tweet.id_str), "class": ('tweet') }, {"id":true})) + "><a" + (jade.attrs({ 'href':("https://twitter.com/" + (tweet.user.screen_name) + ""), "class": ('account_group') }, {"href":true})) + "><img" + (jade.attrs({ 'src':(tweet.user.profile_image_url), 'alt':(tweet.user.name) }, {"src":true,"alt":true})) + "/><span class=\"name\">" + (jade.escape(null == (jade.interp = tweet.user.name) ? "" : jade.interp)) + "</span>&nbsp;<span class=\"screen_name\"><span>@</span><span>" + (jade.escape(null == (jade.interp = tweet.user.screen_name) ? "" : jade.interp)) + "</span></span></a><div class=\"text\">" + (jade.escape(null == (jade.interp = tweet.text) ? "" : jade.interp)) + "</div><time" + (jade.attrs({ 'datetime':(tweet.created_at) }, {"datetime":true})) + ">" + (jade.escape(null == (jade.interp = (new Date(tweet.created_at)).toLocaleTimeString()) ? "" : jade.interp)) + "</time>&nbsp;<span>From</span>&nbsp;<span class=\"from\">" + (null == (jade.interp = tweet.source) ? "" : jade.interp) + "</span>");
if ( tweet.in_reply_to_screen_name)
{
buf.push("&nbsp;<span>in reply to</span>&nbsp;<a" + (jade.attrs({ 'href':("https://twitter.com/" + (tweet.in_reply_to_screen_name) + ""), "class": ('in_reply_to') }, {"href":true})) + "><span class=\"screen_name\"><span>@</span><span>" + (jade.escape(null == (jade.interp = tweet.in_reply_to_screen_name) ? "" : jade.interp)) + "</span></span></a>");
}
buf.push("</article>");
}
return buf.join("");
}
