require 'errors/private_chat_only'

class Command
  def self.parse(message, entity)
    return false unless entity.type == 'bot_command'

    full_command = message.text[entity.offset, entity.length]
    command, addressee = full_command.split('@')
    command.gsub! /\A\//, ''

    unless message.chat.type == 'private'
      my_username = Responder.instance.api.get_me['result']['username']

      return false unless addressee == my_username
    end

    self.new message, command
  end

  private
  def initialize(message, command)
    @message = message
    @chat_id = message.chat.id
    @command = command

    Responder.respond(@chat_id, @message.message_id) do
      begin
        send(command)
      rescue Errors::PrivateChatOnly => e
        e.message
      rescue NoMethodError
        "Invalid command"
      rescue => e
        Rails.logger.error e.inspect
        e.message
      end
    end
  end

  def register
    pm_only

    u = User.create!(
      tg_id:    @message.from.id,
      username: @message.from.username.downcase
    )

    "Added you " +
    ("(@#{u.username})" if u.username.present?) +
    " to my watchlist"
  end

  def pm_only(msg = nil)
    msg = "Open a private chat with me to #{@command}" unless msg.present?

    raise Errors::PrivateChatOnly, msg unless @message.chat.type == 'private'
  end
end
