module Initialization
  class CreateUser
    include Interactor

    delegate :data, to: :context

    def call
      context.fail! if user_exists?
      context.result = create_user
    end

    private

    def create_user
      User.create(chat_id: data["chat"]["id"], name: data["from"]["first_name"])
    end

    def user_exists?
      User.find_by_chat_id(data["chat"]["id"]).present?
    end
  end
end
