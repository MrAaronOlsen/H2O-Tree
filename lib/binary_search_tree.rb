require_relative 'node'
require_relative 'leaf'

class BinarySearchTree

  attr_accessor :head

  def initialize
    @head = Leaf.new
  end

  def insert(key = nil, value = nil)
    @head = head.insert(Node.new(key, value))
  end 

end