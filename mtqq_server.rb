#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'mqtt'

# MQTTHOST = "free.mqtt.shiguredo.jp"
MQTTHOST = "test.mosquitto.org"
USERNAME = "example@github"
PASSWORD = "<password>"
TOPIC = "design-fun.com/test"

# MQTTに接続するためのクライアントを作成します
client = MQTT::Client.new(
  :host => MQTTHOST,
  :port => 1883,
  # :username => USERNAME,
  # :password => PASSWORD
)

# 接続します Pbulish example
client.connect do |c|
  # Publishします
  result=c.publish(TOPIC, "message from windows")
  print result
end
