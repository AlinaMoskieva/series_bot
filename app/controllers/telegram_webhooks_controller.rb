class TelegramWebhooksController < ApplicationController
  def start
    context = current_user || Initialization::CreateUser.call(data: payload).result
    respond_with :message, text: I18n.t(".start", username: context.name), parse_mode: "markdown"
  end

  def add_serial(cmd = nil, *)
    result = Serials::Add.call(data: payload, user: current_user).result
    respond_with_message(result)
  end

  def my_serials
    result = Serials::MyList.call(data: payload, user: current_user).result
    respond_with_message(result)
  end

  def remove_serial(cmd = nil, *)
    result = Serials::Remove.call(data: payload, user: current_user).result
    respond_with_message(result)
  end

  def movies(cmd = nil, *)
    result = Movies::New.call.list
    respond_with_message(result)
  end

  def most_popular(cmd = nil, *)
    result = Movies::Popular.call
    respond_with_message_and_buttons(result.list, result.buttons)
  end

  def callback_query(data)
    respond_with :message, text: data.to_s, parse_mode: "markdown"
  end
end
