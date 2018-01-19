class ApplicationController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext
end
