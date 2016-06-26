class DigitalBit

  attr_reader :value, :state

  def initialize(value)
    if value.to_i == 1
      @state = :high
    else
      @state = :low
    end
  end

end
