class ApplicationController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext
    include Authentication

    def respond_with_message(text)
      respond_with :message, text: text, parse_mode: "markdown"
    end

    def respond_with_message_and_buttons(text, buttons)
      respond_with :message, text: text, parse_mode: "markdown", reply_markup: { inline_keyboard: buttons, resize_keyboard: true, one_time_keyboard: true }
    end
end
