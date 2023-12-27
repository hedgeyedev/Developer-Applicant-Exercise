$(document).ready(function() {
  const apiUrl = 'http://localhost:3000/1.1/statuses/status.json';

  $.getJSON(apiUrl, function(tweets) {
    const tweetContainer = $('#tweets');
    tweetContainer.empty(); // Clear existing content

    $.each(tweets, function(index, tweet) {
      const tweetElement = $('<li>').html(`
        <img src="${tweet.user.profile_image_url}" alt="${tweet.user.name} profile image">
        <a href="${tweet.user.url}">${tweet.user.name}</a>
        <p>${tweet.text}</p>
        <time>${tweet.created_at}</time>
        <span>via ${tweet.source}</span>
      `);
      tweetContainer.append(tweetElement);
    });
  }).fail(function(error) {
    console.error('Error fetching tweets:', error);

    // Detailed error logging:
    console.error('Error status:', error.status);

    $('#tweets').append('<p class="error">Error fetching tweets. Please try again later.</p>');
  });
});
