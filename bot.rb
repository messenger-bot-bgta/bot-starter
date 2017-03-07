require 'facebook/messenger'

include Facebook::Messenger

Bot.on :postback do |postback|
end

Bot.on :message do |message|
  message.reply(text: message.text)
end
