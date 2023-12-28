function removeTags(str) {
  return str.replace(/(<([^>]+)>)/ig, '');
}

document.addEventListener('DOMContentLoaded', function () {
  const tweetsContainer = document.getElementById('tweets-container');

  fetch('/tweets')
    .then(response => response.json())
    .then(tweets => renderTweets(tweets))
    .catch(error => console.error('Error fetching tweets:', error));


  const {a, div, p, img, span} = van.tags
  const Tweet = (tweet) => div({class: 'tweet'},
    div({class: 'img-container'},
      img({src: tweet.user.profile_image_url, alt: 'Profile Image'})
    ),
    div(
      p(
        a({class: 'link', href: tweet.user.url}, '@', tweet.user.screen_name),
        ' ',
        tweet.text
      ),
      div(
        {class: 'date-container'},
        span({class: 'date'}, timeSince(new Date(tweet.created_at))),
        span(' from ', removeTags(tweet.source)) // There may be way to render the source with the tags with VanJS
      )
    ),
  )


  function renderTweets(tweets) {
    van.add(tweetsContainer, tweets.map(tweet => Tweet(tweet)))
  }
});

