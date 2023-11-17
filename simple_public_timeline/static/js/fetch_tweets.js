document.addEventListener('DOMContentLoaded', function() {
  fetch(FAKE_TWITTER_API_URL)
    .then(response => response.json())
    .then(tweets => {
      const tweetsContainer = document.getElementById('tweets');
      tweets.forEach(tweet => {
        const tweetElement = document.createElement('li');
        tweetElement.innerHTML = `
          <img src="${tweet.user.profile_image_url}">
          <a href="https://twitter.com/${tweet.user.screen_name}">${tweet.user.screen_name}</a>
          <div>${tweet.text}</div>
          <div class="source"> ${moment(tweet.created_at).fromNow()} from ${stripTags(tweet.source)}</div>
          <hr>
        `;
        tweetsContainer.appendChild(tweetElement);
      });
    })
    .catch(error => {
      console.error('Error fetching tweets:', error);
    });
});

function stripTags(source) {
  let div = document.createElement('div');
  div.innerHTML = source;
  return div.textContent || div.innerText || "";
}