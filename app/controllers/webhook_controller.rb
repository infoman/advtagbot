class WebhookController < ApplicationController
  def index
    unless params[:key] === ENV['ADVTAG_BOT_HOOKKEY']
      raise ActionController::RoutingError, 'Not Found'
    end

    @update = Telegram::Bot::Types::Update.new(params[:webhook].permit!)
    @api = Responder.instance.api

    msg = (@update.message || @update.edited_message)

    if msg.present?
      msg.entities.each { |entity| Command.parse msg, entity }
    end

    render text: 'ok', content_type: 'text/plain'
  end
end
