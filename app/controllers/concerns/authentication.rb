module Authentication
  extend ActiveSupport::Concern

  included do
    def current_user
      @current_user ||= User.find_by_chat_id(payload["chat"]["id"])
    end
  end

end
