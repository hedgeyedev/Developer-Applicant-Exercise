import React, { useEffect, useState } from "react";
import { TweetCard } from "./TweetCard";
import { Tweet } from "./types";

interface TweetsListProps {
  tweets_url: string;
}

/**
 * Renders a list of tweets as cards
 *
 * @param tweets_url Url to fetch the set of tweets. In this case it is passed as
 * The rails helper to via_js
 */
const TweetsList = ({ tweets_url }: TweetsListProps) => {
  const [recentTweets, setRecentTweets] = useState<Tweet[]>([]);

  // Runs when the component mounts. We return an empty array from useEffect
  // so that this only runs once after mount. If we were going to poll for updates
  // or use server sent events, we would set that up here. Here we just make
  // a basic GET request and update the state with the tweets.
  useEffect(() => {
    (async () => {
      // Make the request for JSON
      const response = await fetch(`${tweets_url}`, {
        headers: { contentType: "application/json" },
      });

      if (!response.ok) {
        // Handle any errors here. Something like a toast
        return;
      }
      // get the response JSON
      const tweets: Tweet[] = await response.json();
      console.log(tweets);
      // Update the state with the tweets
      setRecentTweets(tweets);
    })();
  }, []);

  return (
    <div>
      {recentTweets.map((tweet) => {
        return <TweetCard key={tweet.id_str} tweet={tweet} />;
      })}
    </div>
  );
};

export default TweetsList;
