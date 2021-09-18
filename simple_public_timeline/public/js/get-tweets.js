// Once the page has rendered then asynchronously fetch the 20 most recent tweets
window.onload = fetch_tweets

/*
    Performs a get request to /tweets route to fetch the 20 most recent tweets in JSON format and
    setup a handler function to parse the HTTP GET response and render the tweets view
*/
function fetch_tweets() {
    httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
        renderErrorMessage('JavaScript disabled. Enable JS and reload the page.');
        return false;
    }
    // Handler function to be invoked once HTTP GET request has completed
    httpRequest.onreadystatechange = renderTweets;

    httpRequest.open('GET', '/tweets');
    httpRequest.send();
}

/*
    Standardize displaying errors to the user on the screen
*/
function renderErrorMessage(errorMessage) {
    var errorMessageElement = document.getElementById("error-message");
    errorMessageElement.innerHTML = errorMessage;
}

/*
    Injects and returns the required tweet's information into the table data template
    to be inserted in a table row when rendering the tweets table in the view
*/
function getTweetViewData(tweet) {
    return `
<td>
    <p>
        <img class="fit-picture" src="${tweet.user_profile_image}" alt="Twitter User Profile Picture">
        <a href="${tweet.user_profile_link}">${tweet.username}</a> ${tweet.text}
    </p>
    <p>
        ${tweet.publish_time} from ${tweet.source}
    </p>
</td>`;
}

/*
    Checks the HTTP GET request response, parses the response data, and updates
    the view to display the 20 most recent tweets to the user on the screen
*/
function renderTweets() {
    try {
        if (httpRequest.readyState == XMLHttpRequest.DONE) {
            if (httpRequest.status == 200) {
                var response = JSON.parse(httpRequest.responseText);
                alert(response.tweets[0].user_profile_link);
                return true;
            }
            else {
                renderErrorMessage('Failed to fetch tweets');
                return false;
            }
        }
    } catch(e) {
        renderErrorMessage('Unexpected error occurred. Try reloading the page again in a few minutes.');
        return false;
    }
}
