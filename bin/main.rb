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
  bot.post_tweet(config.client, bot.quotes[i])
  puts "#{count} tweets made"
  sleep 3600
  bot.twitter_following(config.client)
  sleep 3600
  bot.twitter_retweet(config.client, '#Motivation')
  sleep 3600
  count += 1
  i += 1
  start = false
end
