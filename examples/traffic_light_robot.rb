require 'rubygems'
require 'bundler/setup'

Bundler.require

require_all 'models'

$LOAD_PATH << "#{Dir.pwd}/lib"

connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1411'

device :red, driver: :led, pin: 13
device :yellow, driver: :led, pin: 12
device :green, driver: :led, pin: 11

device :button, driver: :button, pin: 2, interval: 0.01

device :buzzer, driver: :buzzer, pin: 3

work do
  traffic_light = TrafficLight.new(red, yellow, green)
  puts "Press the button connected on pin #{ button.pin }..."

  on button, :push => proc {  traffic_light.change
                              buzzer.beep(0.1) }
end
