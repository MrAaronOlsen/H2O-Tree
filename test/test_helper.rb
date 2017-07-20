require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'test:units'

require "minitest/autorun"
require "minitest/pride"
require "pry"

require "./lib/tree"
require "./lib/node"
require "./lib/leaf"