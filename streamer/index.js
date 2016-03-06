var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var Twitter = require('twitter');
var port = process.env.HTTP_PORT;

var client = new Twitter({
  consumer_key: process.env.TWITTER_CONSUMER_KEY,
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
  access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY,
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
});

function persistTweet(tweet) {
  var request = require('request');
  request.post({ url: process.env.WEB_URL, form: { tweet: {
      tweet_id: tweet.id,
      text: tweet.text,
      user_screen_name: tweet.user.screen_name,
      user_name: tweet.user.name,
      user_image_url: tweet.user.image_url,
    } }
  }, function (error, response, body) {
    if (response.statusCode == 200) {
      console.log('tweet saved');
    }
    else {
      console.log("Error saving tweet: " + response.statusCode);
    }
  });
}

var filter = JSON.parse(process.env.TWITTER_STREAM_FILTER);
client.stream('statuses/filter', filter, function(stream) {
  stream.on('data', function(tweet) {
    io.emit('tweet', tweet);
    persistTweet(tweet);
    console.log(tweet.text);
  });

  stream.on('error', function(error) {
    console.log("Error: " + error);
  });
});


app.get('/', function(req, res){
  res.send('Stream Tweets every day....');
});

http.listen(port, function(){
  console.log("Streamer listening on *:" + port);
});
