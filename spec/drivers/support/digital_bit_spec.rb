require 'spec_helper'

describe DigitalBit do

  describe "#state" do
    it "returns :high for 1" do
      bit = DigitalBit.new(1)
      expect(bit.state).to eq :high
    end

    it "returns :high for '1'" do
      bit = DigitalBit.new('1')
      expect(bit.state).to eq :high
    end

    it "returns :low for 0" do
      bit = DigitalBit.new(0)
      expect(bit.state).to eq :low
    end

    it "returns :high for '0'" do
      bit = DigitalBit.new('0')
      expect(bit.state).to eq :low
    end
  end
end
