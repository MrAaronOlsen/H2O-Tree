require_relative 'leaf'
require 'pry'

class Node

  attr_reader :key, :value, :left, :right

  def initialize(key = nil, value = nil)
    @left = Leaf.new
    @right = Leaf.new
    @key = key
    @value = value
  end
  
  def insert(node)
    if node.value <= @value
      @left = @left.insert(node)
      self
    elsif node.value > @value
      @right = @right.insert(node)
      self
    end
  end

  def include?(value)
    if value == @value
      true
    elsif value <= @value
      @left.include?(value)
    elsif value > @value
      @right.include?(value)
    end
  end

  def depth_of(node_or_value, depth = 0)
    return depth if node_or_value == self || node_or_value == @value

    check_for_value = get_value_from(node_or_value)
    depth+=1

    left_or_right(check_for_value, depth)
  end

  def get_value_from(node_or_value)
    return node_or_value.value if node_or_value.is_a? Node
    node_or_value
  end

  def left_or_right(check_value, arg)
    if check_value <= @value
      @left.depth_of(check_value, arg)
    elsif check_value > @value
      @right.depth_of(check_value, arg)
    end
  end

  def max(max_value = @value)
    @right.max(@value)
  end

  def min(min_value = @value)
    @left.min(@value)
  end

  def leaves(num)
    num = @left.leaves(num)
    @right.leaves(num)
  end

  def health(level, report = [])
    if level == 0
      report << [@value, count_children]
    else
      level-=1
      @left.health(level, report)
      @right.health(level, report)
    end
    report
  end

  def count_children(children = 0)
    children+=1
    children = @left.count_children(children)
    @right.count_children(children)
  end

  def sort(array)
    @left.sort(array)
    array << {@key => @value}
    @right.sort(array)
  end

end