require 'dotenv/load'

require 'facebook/messenger'
require_relative 'bot'

class ServerNoError < Facebook::Messenger::Server

  def call(env)
    begin
      super
    rescue Exception => e

        send("\xF0\x9F\x98\xB1")
        send(e.inspect)
        send(e.backtrace.join("\n")[0..636] + "...")

        @response.status = 200
        @response.finish

    end
  end

  private

  def send(text)
    
     sender_id = parsed_body["entry"][0]["messaging"][0]["sender"]["id"]

      Bot.deliver({
        recipient: {
          id: sender_id
        },
        message: {
          text: text
        }
      }, access_token: ENV['ACCESS_TOKEN'])
  end

end

run ServerNoError
