#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'mqtt'
require 'sqlite3'
require 'json'
require 'iotcom'

class GetFromDB
  def initialize
    @status_arry = []
  end

  def get_status
    @status_arry.clear
    db = SQLite3::Database.new("../MQTT_LED_simple/html/cgi-bin/iot.sqlite3")
    db.busy_timeout=60000
    sql = "select status from led"
    db.execute(sql) do |row|
      @status_arry.push(row[0])
    end
    db.close
    return @status_arry
  end

end

ledDB = GetFromDB.new
jsonStatus = ""
loop do
  jsonStatus = JSON.generate(ledDB.get_status)
  p jsonStatus
  ConnectionMqtt.new.publish_message("design-fun.com/led",jsonStatus)
  sleep 3
end
