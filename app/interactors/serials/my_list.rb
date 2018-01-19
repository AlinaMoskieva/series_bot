module Serials
  class MyList
    include Interactor

    delegate :data, :user, to: :context
    delegate :users_serials, to: :user

    def call
      context.result = compose_message
    end

    private

    def compose_message
      message = ""

      my_serials.each_with_index do |serial, index|
        message += decorate_line(index, serial)
      end

      message
    end

    def my_serials
      Serial.where(id: users_serials.map(&:serial_id))
    end

    def decorate_line(index, serial)
      "#{index + 1}. #{serial.title}\n"
    end
  end
end
