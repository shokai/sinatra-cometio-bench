#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'
Bundler.require

url = ARGV.shift || 'http://localhost:5000/cometio/io'

push_at = nil
times = []

EM.epoll
EM.set_descriptor_table_size 20000
EM::run do
  client = nil

  500.times do
    client = EM::CometIO::Client.new(url).connect

    client.on :foo do |data|
      times.push Time.now - push_at
    end
  end

  client.on :connect do |session|
    puts "connect (session:#{session})"
    EM::add_periodic_timer 2 do
      unless times.empty?
        puts "#{times.size} results"
        puts times.inject(:+)/times.size
      end
      times = []
      push_at = Time.now
      client.push :foo, "bar"
    end
  end
end
