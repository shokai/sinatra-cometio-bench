require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/cometio'
require File.expand_path 'main', File.dirname(__FILE__)

run TestApp
