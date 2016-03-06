require_relative "spec_helper"

RSpec.describe "tweet streamer" do
  describe "index" do
    it "returns tweets from the last 7 days" do
      Tweet.create(text: "That rug really tied the room together.", created_at: Date.today - 8)
      Tweet.create(text: "The Dude abides", created_at: Date.today - 1)

      get "/"
      expect(last_response).to be_ok
      expect(last_response.body).to include "The Dude abides"
      expect(last_response.body).to_not include "That rug really tied the room together."
    end
  end

  describe "create" do
    it "creates a tweet" do
      post "/", tweet: { text: "Obviously you're not a golfer." }
      expect(last_response).to be_ok
      expect(Tweet.first.text).to eq "Obviously you're not a golfer."
    end
  end
end
