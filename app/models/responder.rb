class Responder
  include Singleton

  def initialize
    @api = ::Telegram::Bot::Api.new(ENV['ADVTAG_BOT_TOKEN'])
  end

  attr_accessor :api
end