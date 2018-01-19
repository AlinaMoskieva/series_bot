class TelegramWebhooksController < ApplicationController
  def start
    context = current_user || Initialization::CreateUser.call(data: payload).result
    respond_with :message, text: I18n.t(".start", username: context.name), parse_mode: "markdown"
  end

  def add_serial(cmd = nil, *)
    result = Serials::Add.call(data: payload, user: current_user).result
    respond_with :message, text: result, parse_mode: "markdown"
  end

  def my_serials
    result = Serials::MyList.call(data: payload, user: current_user).result
    respond_with :message, text: result, parse_mode: "markdown"
  end
end
