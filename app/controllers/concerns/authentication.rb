module Authentication
  extend ActiveSupport::Concern

  included do
    def current_user
      @current_user ||= User.find_by_chat_id(current_user_chat_id)
    end
  end

  private

  def current_user_chat_id
    return payload["chat"]["id"] if payload["chat"]
    payload["message"]["chat"]["id"]
  end
end
