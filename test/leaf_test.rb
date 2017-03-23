require "minitest/autorun"
require "minitest/pride"
require "pry"

require "./lib/leaf"
require "./lib/node"

class LeafTest < Minitest::Test

  def test_that_it_is_a_leaf
    leaf = Leaf.new
    assert_instance_of Leaf, leaf
  end

  def test_that_insert_returns_node_that_is_sent_to_it
    leaf = Leaf.new
    assert_instance_of Node, leaf.insert(Node.new)
  end

  def test_that_depth_of_returns_false
    leaf = Leaf.new
    refute leaf.depth_of(Node.new, 10)
  end

  def test_that_include_returns_false
    leaf = Leaf.new
    refute leaf.include?(10)
  end

  def test_that_leaves_adds_to_leaves
    leaf = Leaf.new
    assert_equal leaf.leaves(0), 1
  end

end