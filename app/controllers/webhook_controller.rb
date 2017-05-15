class WebhookController < ApplicationController
  def index
    unless params[:key] === ENV['ADVTAG_BOT_HOOKKEY']
      raise ActionController::RoutingError, 'Not Found'
    end

    @update = Telegram::Bot::Types::Update.new(params[:webhook].permit!)
    @api = Responder.instance.api

    logger.debug  @update.to_compact_hash

    @api.send_message(
      chat_id: ENV['ADVTAG_BOT_FATHER'],
      text: @update.to_compact_hash.inspect,
      disable_web_page_preview: true
    )

    render text: 'ok', content_type: 'text/plain'
  end
end
