import * as React from "react";
import { TweetCard } from "../components/TweetsList";
import * as renderer from "react-test-renderer";

it("render correctly text component", () => {
  const props = {
    tweet: {
      user: {
        screen_name: "John",
        url: "http://myprofile",
        profile_image_url: "string",
      },
      created_at: "Sun Mar 21 22:05:09 +0000 2021",
      source:
        '<a href="http://twitter.com/download/android" rel="nofollow">Twitter for Android</a>',
      text: "some cool tweet test text",
      id_str: "1373757599909224449",
    },
  };
  const TextInputComponent = renderer.create(<TweetCard {...props} />).toJSON();
  expect(TextInputComponent).toMatchSnapshot();
});
