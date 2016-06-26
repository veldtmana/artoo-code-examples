require 'spec_helper'

describe Artoo::Drivers::ShiftRegister do
  let(:device) { double('device') }
  let(:connection) { double('connection') }

  let(:ds) { 14 } # data pin
  let(:sh_cp) { 11 } # clock pin
  let(:st_cp) { 12 } # latch pin

  let(:shift_register) { Artoo::Drivers::ShiftRegister.new(parent: device,
                                                           additional_params: {ds: ds,
                                                                               sh_cp: sh_cp,
                                                                               st_cp: st_cp}) }

  before :each do
    allow(device).to receive(:connection) { connection }
    allow(device).to receive(:ds) { ds }
    allow(device).to receive(:sh_cp) { sh_cp }
    allow(device).to receive(:st_cp) { st_cp }
  end

  describe "#send_byte" do
    let(:byte) { '101' }
    subject { shift_register.send_byte(byte) }

    it "writes the data to the ds pin while switching clock and latch pins" do
      expect(connection).to receive(:digital_write).with(st_cp, :low).ordered

      expect(connection).to receive(:digital_write).with(sh_cp, :low).ordered
      expect(connection).to receive(:digital_write).with(ds, :high).ordered
      expect(connection).to receive(:digital_write).with(sh_cp, :high).ordered

      expect(connection).to receive(:digital_write).with(sh_cp, :low).ordered
      expect(connection).to receive(:digital_write).with(ds, :low).ordered
      expect(connection).to receive(:digital_write).with(sh_cp, :high).ordered

      expect(connection).to receive(:digital_write).with(sh_cp, :low).ordered
      expect(connection).to receive(:digital_write).with(ds, :high).ordered
      expect(connection).to receive(:digital_write).with(sh_cp, :high).ordered

      expect(connection).to receive(:digital_write).with(st_cp, :high).ordered
      subject
    end
  end

end
