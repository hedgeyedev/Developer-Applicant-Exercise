async function getTweets(url) {
  const response = await fetch(url, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer TWITTERTOKEN',
    }
  });
  return response.json();
}

getTweets("https://stream.twitter.com/1.1/statuses/sample.json").then((res) => {
  const container = document.getElementById('render-tweets');

  res.forEach((item) => {
    container.append(`
      <p>Tweet: ${item.text}</p>
      <p>Username: ${item.user.name}</p>
      <p>Profile photo: <img src=${item.user.photo}/></p>
      <p>Source: ${item.source}</p>
      <p>URL: ${item.url}</p>
      <p>Date: ${item.created_at}</p>
      <hr>
    `);
  });
});