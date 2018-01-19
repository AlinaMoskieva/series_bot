class ApplicationController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext
    include Authentication
end
