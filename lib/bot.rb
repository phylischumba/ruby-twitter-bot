require 'rubygems'
require 'twitter'
require 'dotenv'
Dotenv.load



class Bot
  attr_reader :quotes
  def initialize
    @quotes = ["You cannot swim for new horizons until you have the courage to lose sight of the shore", "Sometimes, I dream of becoming real, but I don't know if that is real, or just part of my programming",
    "Any fool can write code that a computer can understand",  "Good programmers write code that humans can understand", "Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live",
     "The programming of the consciousness is based upon what is accepted or believed", "Truth can only be found in one place: the code."]
  end

  def tweet(client, status)
    client.update(status)
  end
  
end




  # def search_tweet(client, hashtag)
  #   client.search(hashtag)
  # end

  # def retweet_tweet(client, hashtag)
  #   search_tweet(client, hashtag).take(3).each do |tweet|
  #     client.retweet(tweet)
  #   end
  # end
  # def follow(client, hashtag)
  #   search_tweet(client, hashtag).take(3).each do |user_id|
  #     client.follow(user_id)
  #   end
  # end


end
