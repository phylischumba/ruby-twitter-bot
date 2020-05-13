require 'rspec'
require_relative '../lib/bot.rb'
require_relative '../lib/config.rb'

describe TwitterBot do
  let(:bot) { TwitterBot.new }
  let(:config) { Config.new }
  let(:client) { config.client }

  describe '#post_tweet' do
    it 'if tweet is posted by an authorized user, it returns a tweet object' do
      expect(bot.post_tweet(config.client, 'Curiosity sparkles passion ')).to be_instance_of(Twitter::Tweet)
    end
    it 'returns argument error if no user and tweet is given' do
      expect { bot.post_tweet }.to raise_error(ArgumentError)
    end
  end

  describe '#twitter_following' do
    it 'returns argument error if none is given' do
      expect { bot.twitter_following }.to raise_error(ArgumentError)
    end
  end

  describe '#check_tweet' do
    it 'returns search results that contain a certain hashtag' do
      expect(bot.check_tweet(config.client, '#Motivation')).to be_instance_of(Twitter::SearchResults)
    end
    it 'returns error when wrong number or no arguments is given' do
      expect { bot.check_tweet }.to raise_error(ArgumentError)
    end
  end
  describe '#twitter_retweet' do
    it 'returns retweeted tweets in an array' do
      expect(bot.twitter_retweet(config.client, '#DailyQuotes')).to be_instance_of(Array)
    end
    it 'raises an error if wrong number of arguments is given' do
      expect { bot.twitter_retweet }.to raise_error(ArgumentError)
    end
  end
end

describe Config do
  let(:config) { Config.new }
  describe '#initialize' do
    it 'should initialize as Config class' do
      expect(config.class).to eql(Config)
    end
  end
end
