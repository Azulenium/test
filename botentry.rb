# -*- coding: utf-8 -*-
 
require_relative 'twitterbot'
 
Twitter.configure {|config|
  config.consumer_key = 'consumer key'
  config.consumer_secret = 'consumer secret'
  config.oauth_token = 'oauth token'
  config.oauth_token_secret = 'oauth token secret'
}
 
counter = 0
while counter < 10
  begin
    bot = TwitterBot::Crawler.new('BOTのscreen_name', '取得元のscreen_name')
    bot.study
    bot.reply_to_mentions unless ARGV.include?("--no-reply")
    bot.tweet unless ARGV.include?("--no-tweet")
    break
  rescue Exception => e
    puts e
    counter += 1
  end
end
