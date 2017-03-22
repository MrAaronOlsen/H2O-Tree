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

  def test_that_insert_returns_depth_of_inserted_node
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 10)
    node2 = Node.new("Movie", 11)
    node3 = Node.new("Movie", 12)
    node4 = Node.new("Movie", 13)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    assert_equal b_tree.insert(node4), 3
  end

  def test_that_include_returns_true_on_right_heavy_tree
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 10)
    node2 = Node.new("Movie", 11)
    node3 = Node.new("Movie", 12)
    node4 = Node.new("Movie", 13)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)

    assert b_tree.include?(13)
  end

  def test_that_include_returns_true_on_left_heavy_tree
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 13)
    node2 = Node.new("Movie", 12)
    node3 = Node.new("Movie", 11)
    node4 = Node.new("Movie", 10)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)

    assert b_tree.include?(10)
  end

  def test_that_include_returns_true_on_balanced_tree
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 12)
    node2 = Node.new("Movie", 10)
    node3 = Node.new("Movie", 14)
    node4 = Node.new("Movie", 11)
    node5 = Node.new("Movie", 8)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)
    b_tree.insert(node5)

    assert b_tree.include?(8)
  end

  def test_that_include_returns_false_on_balanced_tree
    b_tree = BinarySearchTree.new
    node1 = Node.new("Movie", 12)
    node2 = Node.new("Movie", 10)
    node3 = Node.new("Movie", 14)
    node4 = Node.new("Movie", 11)
    node5 = Node.new("Movie", 8)
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)
    b_tree.insert(node5)

    refute b_tree.include?(7)
  end

end