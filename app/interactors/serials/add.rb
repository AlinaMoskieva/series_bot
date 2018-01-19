module Serials
  class Add
    include Interactor

    delegate :data, :user, to: :context

    def call
      create_user_serial
      context.result = compose_message
    end

    private

    def create_user_serial
      UsersSerial.create(user: user, serial: find_or_create_serial)
    end

    def find_or_create_serial
      Serial.find_by_title(prepare_text) || Serial.create(title: prepare_text)
    end

    def prepare_text
      @title ||= data["text"].gsub("/add_serial", "").strip
    end

    def compose_message
      "#{prepare_text} добавлен"
    end
  end
end
