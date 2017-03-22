require_relative 'leaf'

require 'pry'

class Node

  attr_reader :left, :right, :key, :value

  def initialize(key = nil, value = nil)
    @left = Leaf.new
    @right = Leaf.new
    @key = key
    @value = value
  end
  
  def insert(node)
    if node.value < value
      @left = left.insert(node)
    else node.value > value
      @right = right.insert(node)
    end
  end

end