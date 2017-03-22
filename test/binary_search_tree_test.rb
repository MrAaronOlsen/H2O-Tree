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

end