class Responder
  include Singleton

  def initialize
    @api = ::Telegram::Bot::Api.new(ENV['ADVTAG_BOT_TOKEN'])
  end

  def self.respond(chat, message = nil)
    instance.api.send_message(
      chat_id: chat,
      reply_to_message_id: message,
      text: yield
    )
  end

  attr_accessor :api
end
