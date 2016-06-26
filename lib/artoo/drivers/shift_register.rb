module Artoo
  module Drivers
    class ShiftRegister < Driver
      require_relative 'support/digital_bit'

      COMMANDS = [:send_byte].freeze

      attr_reader :ds,    #data pin
                  :sh_cp, #clock pin
                  :st_cp  #latch pin

      def initialize(params = {})
        @ds = params[:additional_params][:ds]
        @sh_cp = params[:additional_params][:sh_cp]
        @st_cp = params[:additional_params][:st_cp]
        super
      end

      def send_byte(byte)
        set_low(st_cp)
        byte.each_char do |ch|
          send_bit(DigitalBit.new(ch))
        end
        set_high(st_cp)
      end

      private

      def send_bit(digital_bit)
        set_low(sh_cp)
        set_state(ds, digital_bit.state)
        set_high(sh_cp)
      end

      def set_low(pin)
        connection.digital_write(pin, :low)
      end

      def set_state(pin, state)
        connection.digital_write(pin, state)
      end

      def set_high(pin)
        connection.digital_write(pin, :high)
      end
    end
  end
end
