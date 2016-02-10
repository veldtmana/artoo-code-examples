require 'spec_helper'

describe TrafficLight do
  let(:red) { Led.new(:red) }
  let(:yellow) { Led.new(:yellow) }
  let(:green) { Led.new(:green) }
  let(:traffic_light) { TrafficLight.new(red, yellow, green) }

  describe "#change" do
    context "state = red" do
      it "changes state to green" do
        expect{ traffic_light.change }.to change{ traffic_light.state }.from("red").to("green")
      end

      it "switches the green led on" do
        expect(green).to receive(:on)
        traffic_light.change
      end

      it "switches the red led off" do
        expect(red).to receive(:off)
        traffic_light.change
      end
    end

    it "changes from green to yellow" do
      traffic_light.state = "green"
      expect{ traffic_light.change }.to change{ traffic_light.state }.from("green").to("yellow")
    end

    it "changes from yellow to red" do
      traffic_light.state = "yellow"
      expect{ traffic_light.change }.to change{ traffic_light.state }.from("yellow").to("red")
    end

  end

  Led = Struct.new(:color) do
    def on
      "on"
    end

    def off
      "off"
    end
  end
end
