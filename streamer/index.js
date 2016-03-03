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


var filter = JSON.parse(process.env.TWITTER_STREAM_FILTER);
client.stream('statuses/filter', filter, function(stream) {
  stream.on('data', function(tweet) {
    io.emit('tweet', tweet);
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
  console.log("listening on *:" + port);
});
