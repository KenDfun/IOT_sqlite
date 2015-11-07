#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'mqtt'
require 'iotcom'
require 'json'

topic = "design-fun.com/#"

class SubscribeFunc
  def callback(topic,message)
    arry = []
    puts "#{topic}: #{message}"
    arry = JSON.parse(message)

    (0..2).each do |i|
      puts "led[#{i}]=#{arry[i]}"
    end

  end
end

cbk = SubscribeFunc.new
ConnectionMqtt.new.subscribe_message_loop(topic,cbk)
