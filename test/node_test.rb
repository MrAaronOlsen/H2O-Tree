require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

class NodeTest < Minitest::Test

  def test_that_it_is_a_node
    node = Node.new
    assert_instance_of Node, node
  end

  def test_that_right_and_left_are_leafs_when_created
    node = Node.new
    assert_instance_of Leaf, node.left
    assert_instance_of Leaf, node.right
  end

  def test_that_key_and_value_are_nil_when_created
    node = Node.new
    refute node.key
    refute node.value
  end

  def test_that_insert_into_right_when_right_is_leaf
    node = Node.new("Movie", 5)
    node.insert(Node.new("Better Movie", 10))
    assert_instance_of Node, node.right
  end

  def test_that_insert_into_left_when_right_is_leaf
    node = Node.new("Movie", 5)
    node.insert(Node.new("Worst Movie", 0))
    assert_instance_of Node, node.left
  end

  def test_that_depth_returns_depth_when_looking_for_node
    node = Node.new("Movie", 5)
    assert_equal node.depth_of(node, 10), 10
  end

  def test_that_depth_returns_depth_when_looking_right_for_node
    node1 = Node.new("Movie", 5)
    node2 = Node.new("Movie", 10)
    node1.insert(node2)
    assert_equal node1.depth_of(node2), 1
  end

  def test_that_depth_returns_depth_when_looking_left_for_node
    node1 = Node.new("Movie", 10)
    node2 = Node.new("Movie", 5)
    node1.insert(node2)
    assert_equal node1.depth_of(node2), 1
  end


end