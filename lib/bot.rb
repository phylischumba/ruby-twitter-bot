require 'rubygems'
require 'twitter'
require 'dotenv'
Dotenv.load

class TwitterBot
  attr_reader :quotes
  # rubocop disable: Layout/LineLength
  def initialize
    @quotes = ['You cannot swim for new horizons until you have the courage to lose sight of the shore',
               "Sometimes, I dream of becoming real, but I don't know if that is real, or just part of my programming",
               'Any fool can write code that a computer can understand',
               'Good programmers write code that humans can understand',
               'Always code as if the guy who ends up maintaining your code will be a violent
                psychopath who knows where you live',
               'The programming of the consciousness is based upon what is accepted or believed',
               'Truth can only be found in one place: the code',
               'You cannot swim for new horizons until you have courage to lose sight of the shore']
  end

  # rubocop enable: Layout/LineLength
  def post_tweet(client, status)
    client.update(status)
  end

  def twitter_following(client)
    followed = []
    client.search('#Motivation', result_type: 'recent').take(10).each do |tweet|
      followed << tweet.user.screen_name
    end
    client.follow(followed).uniq!
  end

  def check_tweet(client, hashtag)
    client.search(hashtag)
  end

  def twitter_retweet(client, hashtag)
    check_tweet(client, hashtag).take(3).each do |tweet|
      client.retweet(tweet)
    end
  end
end
