if defined?(Rails::Server) || defined?(PhusionPassenger)
  Rails.logger.info "Initializing bot webhook listener"

  Telegram::Bot::Client.run(ENV['ADVTAG_BOT_TOKEN'], logger: Rails.logger) do |bot|
    bot.api.set_webhook(
      url: "https://#{ENV['ADVTAG_BOT_HOST']}/webhook/#{ENV['ADVTAG_BOT_HOOKKEY']}"
    )
  end
end