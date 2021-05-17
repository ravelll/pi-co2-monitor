#!/usr/bin/env ruby
require 'i2c/drivers/ss1602'
require 'atmo'

## Set your credential
ENV['USERNAME'] = ''
ENV['PASSWORD'] = ''
ENV['CLIENT_ID'] = ''
ENV['CLIENT_SECRET'] = ''

display = I2C::Drivers::SS1602::Display.new('/dev/i2c-1', 0x3f)
client = Atmo::Api.new

at_exit { display.clear }

loop do
  if client.authenticate
    data = client.get_station_data
    co2_concentration = data["body"]["devices"].first["dashboard_data"]["CO2"]
    display.clear
    display.text('CO2 Concentr', 0)
    display.text("#{co2_concentration} ppm", 1)
  else
    raise "Authentication failed"
  end

  trap("INT") { exit 0 }
  sleep(60)
end
