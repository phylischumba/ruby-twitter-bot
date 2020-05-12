require_relative '../lib/config.rb'
require_relative '../lib/bot.rb'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

config = Config.new
bot = Bot.new

start = true
i = 0
count = 0
while start
   bot.tweet(config.client, bot.quotes[i])
  
  i += 1
  count += 1
end

    





  
# i = 0
# count = 0
# loop do
#   i = i > 10 ? i % 10 : i
#   bot.follow(config)
#   puts("Published #{count + 1} tweets")
#   sleep 3600
#   bot.retweet_tweet(config.rest_client, '#rubybenefits')
#   sleep 3600
#   i += 1
#   count += 1
# end