function fetchPostData() {
  fetch('http://localhost:3000/1.1/statuses/status.json?count=20')
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json(); // parse response body from json to readable JS objects
    })
    .then(posts => { // posts is all data
      const tweetsList = document.querySelector('.tweets-list'); // select element from html with class tweets-list
      
      posts.forEach(post => { //loop over posts array of objects

        // forEach post object generate HTML
        let tweetHTML = `
            <div class="tweet">
            <img alt="${post.user.screen_name}'s profile pic" class="profile-image" src="${post.user.profile_image_url}">
            <div class="content">
              <a href="${post.user.url}">
                <strong>${post.user.screen_name}</strong>
              </a>
              <p>${post.text}</p>
              <small>${dateFormat(post.created_at)} via ${sourceFormat(post.source)}</small>
            </div>
          </div>
          <hr>`
        tweetsList.insertAdjacentHTML('beforeend', tweetHTML) // insert generated HTML into tweetsList, beforend appends the html at the end
      });
    })
    .catch(error => {
      console.error('Display Error: ', error);
    });
}

function dateFormat(date) {
  return date.split(' ').slice(0,4).join(' ')
}

function sourceFormat(source) {
  return source.split('">').pop().split('<')[0]
}

// On load event, occurs after the page loads
document.addEventListener('DOMContentLoaded', function() {
  fetchPostData();
});
