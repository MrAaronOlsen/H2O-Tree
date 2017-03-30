require_relative 'leaf'
require 'pry'

class Node

  attr_accessor :key, :value, :childs

  def initialize(key = nil, value = nil)
    @childs = [Leaf.new, Leaf.new]
    @key = key
    @value = value
  end

  def insert(node)
    filter(node.value) do |go|
      @childs[go] = @childs[go].insert(node)
      self
    end
  end

  def include?(value)
    return true if value == @value
    filter(value) { |go| @childs[go].include?(value) }
  end

  def depth_of(value, depth = 0)
    return depth if value == self || value == @value

    value = value_node?(value)
    depth+=1

    filter(value) { |go| @childs[go].depth_of(value, depth) }
  end

  def value_node?(thing)
    return thing.value if thing.is_a? Node
    thing
  end

  def delete(delete_value)
    node = replace(delete_value)
    remove(node)
  end

  def remove(node)
    get_child(node) do |go|
      node = @childs[go]
      @childs[go] = Leaf.new
      return node
    end

    filter(node.value) { |go| @childs[go].remove(node) }
  end

  def replace(value)
    if @value == value
      return assign_new(fetch_node(@childs[1].min))
    end
    filter(value) { |go| @childs[go].replace(value) }
  end

  def assign_new(replacement)
    @key = replacement.key
    @value = replacement.value
    self
  end

  def fetch_node(value)
    return self if @value == value
    filter(value) { |go| @childs[go].fetch_node(value) }
  end

  def max(value = nil)
    @childs[1].max(@value)
  end

  def min(value = nil)
    @childs[0].min(@value)
  end

  def leaves(num)
    num = @childs[0].leaves(num)
    @childs[1].leaves(num)
  end

  def health(level, report = [])
    if level == 0
      report << [@value, count_children]
    else
      level-=1
      @childs[0].health(level, report)
      @childs[1].health(level, report)
    end
    report
  end

  def count_children(children = 0)
    children+=1
    children = @childs[0].count_children(children)
    @childs[1].count_children(children)
  end

  def sort(array)
    @childs[0].sort(array)
    array << {@key => @value}
    @childs[1].sort(array)
  end

  def filter(value)
    value <= @value ? yield(0) : yield(1)
  end

  def get_child(node)
    @childs[0] == node ? yield(0) : yield(1)
  end

end
