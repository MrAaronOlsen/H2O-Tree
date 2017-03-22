require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"
require "./lib/leaf"

class BinaryTreeTest < Minitest::Test

  def test_that_it_is_a_binary_search_tree
    b_tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, b_tree
  end

  def test_that_head_is_leaf_when_created
    b_tree = BinarySearchTree.new
    assert_instance_of Leaf, b_tree.head
  end

  def test_that_head_becomes_node_on_initial_insert
    b_tree = BinarySearchTree.new
    b_tree.insert(Node.new)
    assert_instance_of Node, b_tree.head
  end

  def test_that_depth_of_returns_nil_when_no_head
    b_tree = BinarySearchTree.new
    assert_nil b_tree.depth_of(Node.new)
  end

  def test_that_depth_of_returns_zero_when_only_head_exists
    b_tree = BinarySearchTree.new
    node = Node.new("Movie", 10)
    b_tree.insert(node)
    assert_equal b_tree.depth_of(node), 0
  end

  def test_that_depth_of_returns_depth_of_node
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 10)
    node2 = Node.new("Movie", 11)
    node3 = Node.new("Movie", 12)
    node4 = Node.new("Movie", 13)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)
    assert_equal b_tree.depth_of(node4), 3
  end

end