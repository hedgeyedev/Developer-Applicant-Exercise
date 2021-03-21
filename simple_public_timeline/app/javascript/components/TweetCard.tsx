import React from "react";
import ReactHtmlParser from "react-html-parser";
import { formatDateString } from "./helpers";
import { Tweet } from "./types";

interface TweetCardProps {
  tweet: Tweet;
}

/**
 * Renders a tweet
 * @param Tweet a tweet with profile image, user, and created date
 */
export const TweetCard = ({ tweet }: TweetCardProps) => {
  const {
    user: { url, screen_name, profile_image_url },
    created_at,
    source,
    text,
  } = tweet;

  return (
    <div className="tweet-card">
      <div className="icon">
        <img src={profile_image_url} />
      </div>
      <div className="tweet-body">
        <p>
          <a href={url}>{screen_name}</a>
          {text}
        </p>
        <h5>{formatDateString(created_at)}</h5>
        <h6>{ReactHtmlParser(source)}</h6>
      </div>
    </div>
  );
};
