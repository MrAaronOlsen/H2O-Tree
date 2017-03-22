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

  def include?(value)
    if value == @value
      true
    elsif value < @value
      @left.include?(value)
    elsif value > @value
      @right.include?(value)
    end
  end

  def depth_of(node_or_value, depth = 0)
    return depth if node_or_value == self || node_or_value == @value

    check_value = get_value_from(node_or_value)
    depth+=1

    left_or_right(check_value, depth)
  end

  def left_or_right(check_value, arg)
    if check_value < @value
      @left.depth_of(check_value, arg)
    elsif check_value > @value
      @right.depth_of(check_value, arg)
    end
  end

  def get_value_from(thing)
    return thing.value if thing.is_a? Node
    thing
  end

  def display
    puts "Key: #{key}, Value: #{value}"
    @left.display
    @right.display
  end

end