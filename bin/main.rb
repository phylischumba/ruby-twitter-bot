#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
require 'rubygems'
require 'twitter'

config = Config.new
bot = TwitterBot.new

start = true
i = 0
count = 1
loop do
  bot.post_tweet(config.client, bot.quotes[i] + ' #Motivation #DailyQuotes')
  puts "#{count} tweets made"
  sleep 14_400
  bot.twitter_following(config.client)
  sleep 14_400
  bot.twitter_retweet(config.client, '#Motivation')
  sleep 14_400

  count += 1
  i += 1
  start = false
end
