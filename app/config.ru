require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/base'
require 'sinatra/cometio'
require File.expand_path 'main', File.dirname(__FILE__)

EM.epoll
EM.set_descriptor_table_size 20000
run TestApp
