#!/usr/bin/env ruby

require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
require 'rubygems'
require 'twitter'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

def run
  i = 0
  config = Config.new
  bot = Bot.new
  bot.post_tweet(config.client, bot.quotes[i])
  bot.following(config.client)
  bot.retweet_tweet(config.client, '#Motivation')
  i += 1
end

print run

scheduler.every '12h' do
  run
end
scheduler.join

