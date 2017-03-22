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
      self
    elsif node.value > value
      @right = right.insert(node)
      self
    end
  end

  def depth_of(node, depth = 0)
    return depth if node == self
    depth+=1
    if node.value < value
      left.depth_of(node, depth)
    elsif node.value > value
      right.depth_of(node, depth)
    end
  end

  def display
    puts "Key: #{key}, Value: #{value}"
    @left.display
    @right.display
  end

end