document.addEventListener('DOMContentLoaded', function () {
  $(".date").each(function() {
    $(this).text(function(i, date)  {
      return timeSince(new Date(date));
    });
  })
});

