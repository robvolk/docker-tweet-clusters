class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filter,           type: String
  field :tweet_id,         type: String
  field :text,             type: String
  field :user_screen_name, type: String
  field :user_name,        type: String
  field :user_image_url,   type: String
end
