import React from 'react';


const axios = require('axios');

const App = () => {
  return (
    <div>
      <h1>Recent Public Tweets</h1>
      <h2>What everyone on Twitter is talking about</h2>
      {axios.get('/tweets')
        .then(function (response) {
          response.list.map(tweet =>
            <div class="card">
              <div class="container">
                <h4><b>tweet.username</b></h4>
                <p>tweet.text</p>
                <footer>tweet.created_at</footer>
              </div>
            </div>
          )
        })
        .catch(function (error) {
          console.log(error);
        })}
    </div>
  );
};

export default App;
