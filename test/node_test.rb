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

end