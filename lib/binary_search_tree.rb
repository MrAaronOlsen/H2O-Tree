require_relative 'node'
require_relative 'leaf'

class BinarySearchTree

  attr_reader :head

  def initialize
    @head = Leaf.new
  end

  def insert(node)
    @head = head.insert(node)
    depth_of(node)
  end 

  def depth_of(node)
    @head.depth_of(node)
  end

  def display_tree
    @head.display
  end

end