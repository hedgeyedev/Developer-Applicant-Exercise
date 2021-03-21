import * as React from "react";
import * as renderer from "react-test-renderer";
import TweetsList from "../components/TweetsList";

it("SubjectToBeTested renders correctly", () => {
  const props = { tweets_url: "http://test.com" };
  const tree = renderer.create(<TweetsList {...props} />).toJSON();
  expect(tree).toMatchSnapshot();
});
