#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'

config = Config.new
bot = Bot.new

start = true
i = 0
count = 0
while start
  bot.tweet(config.client, bot.quotes[i])
  sleep 3600
  bot.following(config.client)
  sleep 3600
  bot.retweet_tweet(config.client, '#Motivation')
  sleep 3600
  i += 1
  count += 1
end
