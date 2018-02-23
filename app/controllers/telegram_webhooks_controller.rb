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
    result = Movies::New.call
    respond_with_message_and_buttons(result.list, result.buttons)
  end

  def most_popular(cmd = nil, *)
    result = Movies::Popular.call
    respond_with_message_and_buttons(result.list, result.buttons)
  end

  def film_info(data)
    result = Movies::Info.call(data).result
    respond_with_message(result)
  end

  def callback_query(data)
    return send(Menu::METHODS_TO_CALL[data.to_sym]) if data.to_sym.in? Menu::METHODS_TO_CALL.keys
    return film_info(film: data[1..-1]) if data.start_with?("F")
    respond_with :message, text: Menu::ERROR_MESSAGE, parse_mode: "markdown"
  end

  def menu(cmd = nil, *)
    respond_with_message_and_buttons(Menu::MENU_TITLE, Menu::MENU_ITEMS)
  end
end
