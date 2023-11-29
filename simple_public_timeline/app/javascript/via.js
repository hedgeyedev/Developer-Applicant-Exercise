document.addEventListener('DOMContentLoaded', function() {
    fetch('http://localhost:4567/1.1/statuses/status.json') // Replace with the actual URL or route helper
        .then(response => response.json())
        .then(tweets => {
            const tweetsContainer = document.getElementById('tweets-js');
            tweets.forEach(tweet => {
                const tweetDiv = document.createElement('div');
                tweetDiv.className = 'tweet';

                const profileImage = document.createElement('img');
                profileImage.src = tweet.user.profile_image_url;
                profileImage.alt = tweet.user.screen_name;
                tweetDiv.appendChild(profileImage);

                const userName = document.createElement('a');
                userName.href = `http://twitter.com/${tweet.user.screen_name}`;
                userName.textContent = tweet.user.screen_name;
                tweetDiv.appendChild(userName);

                const tweetText = document.createElement('p');
                tweetText.textContent = tweet.text;
                tweetDiv.appendChild(tweetText);

                const tweetTime = document.createElement('p');
                tweetTime.textContent = tweet.created_at;
                tweetDiv.appendChild(tweetTime);

                const tweetSource = document.createElement('p');
                tweetSource.innerHTML = `via ${tweet.source}`;
                tweetDiv.appendChild(tweetSource);

                tweetsContainer.appendChild(tweetDiv);
            });
        })
        .catch(error => console.error('Error:', error));
});
