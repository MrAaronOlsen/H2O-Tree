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

  def include?(value)
    @head.include?(value)
  end

  def depth_of(node)
    @head.depth_of(node)
  end

  def make_node_from(key_or_node, value)
    if key_or_node.is_a? Node
      key_or_node
    else
      Node.new(key_or_node, value)
    end
  end

  def display_tree
    @head.display
  end

end