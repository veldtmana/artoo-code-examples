module Artoo
  module Drivers
    class Buzzer < Driver
      COMMANDS = [:beep].freeze

      def initialize(params = {})
        super
      end

      def beep(interval, level=50)
        change_state(pin, level)
        sleep(interval)
        change_state(pin, 0)
        true
      end

      private

      def change_state(pin, level)
        connection.pwm_write(pin, level)
      end
    end
  end
end
