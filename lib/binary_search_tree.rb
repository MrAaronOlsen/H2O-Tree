require_relative 'node'
require_relative 'leaf'

class BinarySearchTree

  attr_reader :head

  def initialize
    @head = Leaf.new
  end

  def insert(key_or_node, value = nil)
    node = make_node_from(key_or_node, value)
    @head = head.insert(node)
    depth_of(node)
  end

  def load(file)
    loads = 0
    nodes = parse(file)
    nodes.each do |node|
      insert(node[0], node[1])
      loads+=1
    end
    loads
  end
  
  def parse(file)
    File.readlines(file).map do |line|
      i = line.index(",")
      value = line[0...i].to_i
      key = line[i+2..-1].chomp
      [key, value]
    end
  end

  def make_node_from(key_or_node, value = nil)
    if key_or_node.is_a? Node
      key_or_node
    else
      Node.new(key_or_node, value)
    end
  end

  def include?(value)
    @head.include?(value)
  end

  def depth_of(node)
    @head.depth_of(node)
  end

  def max
    @head.max
  end

  def min
    @head.min
  end

  def leaves
    @head.leaves(0)
  end

  def health(level)
    total_nodes = count_nodes

    @head.health(level).map do |report|
      report << ((report[1].to_f/total_nodes) * 100).floor
    end
  end

  def count_nodes
    @head.count_children
  end

  def sort
    @head.sort(Array.new)
  end

end