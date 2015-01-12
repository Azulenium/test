# -*- coding: utf-8 -*-
 
require_relative 'botcore'
 
Twitter.configure {|config|
  config.consumer_key = 'KimsIWLyEVXTLaerhQAhNII7R'
  config.consumer_secret = 'HSp1WyfN0dc0AzX8GY5H5ccutHvABSNdvw0csbFXqcgAtAtGCO'
  config.oauth_token = '2779471724-k2OSEpqj1o73QcMi2iQaZd3C8ERHxRjC1avIM8a'
  config.oauth_token_secret = 'LMwOrVvNk9kocwxd9wxPK1rOWNFSkJ1ooJL9cvovBtaqG'
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
