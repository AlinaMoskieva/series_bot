module Serials
  class Remove
    include Interactor

    delegate :data, :user, to: :context
    delegate :users_serials, to: :user

    def call
      remove_serial
      context.result = compose_message
    end

    private

    def remove_serial
      users_serial.destroy
    end

    def serial
      Serial.find_by_title(prepare_text) || context.fail!(result: "Такого сериала нет")
    end

    def users_serial
      users_serials.find_by_serial_id(serial.id) || context.fail!(result: "Такого сериала нет в вашем списке")
    end

    def prepare_text
      @title ||= data["text"].gsub("/remove_serial", "").strip
    end

    def compose_message
      "#{prepare_text} удален"
    end
  end
end
