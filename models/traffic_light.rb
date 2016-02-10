class TrafficLight

  state_machine :state, initial: :red do
    event :change do
      transition :red => :green, :green => :yellow, :yellow => :red
    end

    after_transition any => any do |traffic_light, transition|
      traffic_light.send(transition.to).on
      traffic_light.send(transition.from).off
    end
  end

  attr_reader :red, :yellow, :green

  def initialize(red, yellow, green)
    @red = red
    @yellow = yellow
    @green = green
    super()
  end

end
