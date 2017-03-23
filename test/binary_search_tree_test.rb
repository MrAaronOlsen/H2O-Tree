require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"
require "./lib/leaf"

class BinaryTreeTest < Minitest::Test

  attr_reader :b_tree, :node1, :node2, :node3, :node4, :node5

  def setup
    @b_tree = BinarySearchTree.new
    @node1 = Node.new("Movie", 12)
    @node2 = Node.new("Movie", 10)
    @node3 = Node.new("Movie", 14)
    @node4 = Node.new("Movie", 11)
    @node5 = Node.new("Movie", 8)
    
    b_tree.insert(node1)
    b_tree.insert(node2)
    b_tree.insert(node3)
    b_tree.insert(node4)
    b_tree.insert(node5)
  end

  def test_that_it_is_a_binary_search_tree
    is_a_tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, is_a_tree
  end

  def test_that_head_is_leaf_when_created
    leaf_tree = BinarySearchTree.new
    assert_instance_of Leaf, leaf_tree.head
  end

  def test_that_head_becomes_node_on_initial_insert
    first_insert_tree = BinarySearchTree.new
    first_insert_tree.insert(Node.new)
    assert_instance_of Node, first_insert_tree.head
  end

  def test_that_depth_of_returns_false_when_no_head
    empty_tree = BinarySearchTree.new
    refute empty_tree.depth_of(Node.new)
  end

  def test_that_depth_of_returns_zero_when_only_head_exists
    only_head_tree = BinarySearchTree.new
    only_node = Node.new("Movie", 10)
    only_head_tree.insert(only_node)
    assert_equal only_head_tree.depth_of(only_node), 0
  end

  def test_that_depth_of_returns_depth_of_node
    assert_equal b_tree.depth_of(@node5), 2
  end

  def test_that_depth_of_returns_depth_of_value
    assert_equal b_tree.depth_of(8), 2
  end

  def test_that_insert_returns_depth_of_inserted_node
    node6 = Node.new("Movie", 7)
    assert_equal b_tree.insert(node6), 3
  end

  def test_that_include_returns_true_on_right_heavy_tree
    assert b_tree.include?(12)
  end

  def test_that_include_returns_true_on_left_heavy_tree
    assert b_tree.include?(10)
  end

  def test_that_include_returns_true_on_balanced_tree
    assert b_tree.include?(8)
  end

  def test_that_include_returns_false_on_balanced_tree
    refute b_tree.include?(7)
  end

  def test_that_make_node_from_returns_node
    b_tree = BinarySearchTree.new
    assert_instance_of Node, b_tree.make_node_from(Node.new)
    assert_instance_of Node, b_tree.make_node_from("Movie", 10)
  end

  def test_that_max_returns_max
    assert_equal b_tree.max, 14
  end

  def test_that_min_returns_min
    assert_equal b_tree.min, 8
  end

  def test_that_sort_returns_sorted_array_of_hashes
    assert_equal b_tree.sort, [{"Movie"=>8}, {"Movie"=>10}, {"Movie"=>11}, {"Movie"=>12}, {"Movie"=>14}]
  end

  def test_that_leaves_returns_num_of_leafs
    assert_equal b_tree.leaves, 6
  end

  def test_that_health_returns_report
    assert_equal b_tree.health(1), [[10, 3, 60], [14, 1, 20]]
  end

end