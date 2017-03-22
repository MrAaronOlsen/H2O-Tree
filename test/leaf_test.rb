require "minitest/autorun"
require "minitest/pride"
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

end