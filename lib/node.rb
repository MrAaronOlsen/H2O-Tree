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
    replace(delete_value)
  end

  def replace(replace_value)
    if @value == replace_value
      assign_new(fetch_node(@childs[1].min(@value)))
    else
      filter(replace_value) { |go| @childs[go].replace(replace_value) }
    end
  end

  def remove_child(node)
    if @childs[0] == node[0]
      @childs[0] = Leaf.new
      return node
    elsif @childs[1] == node[0]
      @childs[1] = Leaf.new
      return node
    end
    node = @childs[0].remove_child(node)
    @childs[1].remove_child(node)
  end

  def assign_new(replacement)
    deleted = Node.new(@key, @value)
    @key = replacement.key
    @value = replacement.value
    [replacement, deleted]
  end

  def fetch_node(fetch_value)
    return self if @value == fetch_value
    filter(fetch_value) { |go| @childs[go].fetch_node(fetch_value) }
  end

  def max(value)
    @childs[1].max(@value)
  end

  def min(value)
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

end
