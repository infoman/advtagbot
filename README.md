# Advanced Mention Bot

This will be a Telegram bot which detects when you are mentioned or replied
by someone in a group chat. There's another bot with this functionality,
but this one will be more advanced and will have more Telegram-specific
features.

## Configuration
This bot works in webhook mode, so you will need a Rails application server
such as Phusion Passenger. You will also need to setup HTTPS for your server.

You can get a free SSL certificate from [Let's Encrypt](https://letsencrypt.org/getting-started/) or use whatever other
certificate authority you want.

After you have successfully set up your web server and cloned this repo,
you will need to setup some environment variables for this bot to work:

* `ADVTAG_BOT_TOKEN` — your bot token that [@BotFather](https://t.me/BotFather) gave you
* `ADVTAG_BOT_HOST` — Host name that you set up on your web server (like `yourcoolbot-la7jungea5tuhee.example.com`)
* `ADVTAG_BOT_HOOKKEY` — additional key to secure the server from unauthorized request. Can be any long enough string, but better use tools like pwgen for this. Will be used to setup a webhook on Telegram servers.
* `ADVTAG_BOT_FATHER`  — id or `@username` of your main Telegram account (just in case)

## Web server setup
Web server setup is outsine of scope of this Readme. If all was setup correctly, you should see the "Yay! You’re on Rails!" page when opening your bot's URL by it's HTTPS link (like `https://yourcoolbot-la7jungea5tuhee.example.com`). If it's not there or you are getting an error message, check your webserver documentation, it's logs and the application logs.