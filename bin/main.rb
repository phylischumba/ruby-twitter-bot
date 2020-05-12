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
while start
  bot.post_tweet(config.client, bot.quotes[i])
  puts "#{count} tweets made"
  sleep 43200
  bot.twitter_following(config.client)
  sleep 43200
  bot.twitter_retweet(config.client, '#Motivation')
  sleep 43200

  count += 1
  i += 1
  start = false
end
