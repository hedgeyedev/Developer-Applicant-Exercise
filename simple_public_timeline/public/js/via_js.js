function addTweet(status) {
    var selStr = "#" + status.id;
    if (!$(selStr).length) { // The twitter api occasionally produces duplicates. This skips adding 
                             // the tweet if it has already been displayed. Unfortunately, this 
                             // means there might sometimes be less than 20
        $("div.tweet#template").clone()
            .attr("id", status.id)
            .appendTo("#tweets");
        $(selStr + " a").attr("href", status.user.uri);
        $(selStr + " img").attr("src", status.user.profile_image_url).attr("alt", status.user.name);
        $(selStr + " p").text(status.text);
        $(selStr + " h4").text(status.user.name);
        $(selStr + " small").html("at " + status.created_at + " via " + status.source)
    }
}

function add20() {
    $("#loading img").show();
    $.ajax({
        url: "/get20",
        method: "get"
    }).done(function (data) {
        $.each(JSON.parse(data), function (index, value) {
            addTweet(value);
        });
    }).fail(function () {
        alert("There was an error retrieving data from the server.");
    }).always(function () {
        console.log("always");
        $("#loading img").hide();
    });
}

$(function () {
    add20();
    $("button#more").click(function () {
        add20();
    })
});
