require "minitest/autorun"
require "minitest/pride"
require "pry"

require "./lib/node"
require "./lib/leaf"

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

  def test_that_get_value_from_returns_value_from_value_or_node
    node = Node.new("Movie", 10)
    assert_equal node.get_value_from(Node.new("Move", 6)), 6
    assert_equal node.get_value_from(10), 10
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

  def test_that_depth_returns_depth_when_looking_for_value
    node = Node.new("Movie", 5)
    node.insert(Node.new("Movie", 10))
    assert_equal node.depth_of(10), 1
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

  def test_that_include_returns_false_when_value_not_there
    node = Node.new("Movie", 10)
    refute node.include?(11)
  end

  def test_that_include_returns_true_when_value_in_right_branch
    node1 = Node.new("Movie", 10)
    node2 = Node.new("Movie", 12)
    node1.insert(node2)
    assert node1.include?(12)
  end

  def test_that_include_returns_true_when_value_in_left_branch
    node1 = Node.new("Movie", 12)
    node2 = Node.new("Movie", 10)
    node1.insert(node2)
    assert node1.include?(12)
  end

  def test_that_leaves_returns_number_of_leaves
    node1 = Node.new("Movie", 12)
    assert_equal node1.leaves(0), 2
  end

  def test_that_count_children_returns_children
    node1 = Node.new("Movie", 12)
    node1.insert(Node.new("Movie", 10))
    node1.insert(Node.new("Movie", 40))
    node1.insert(Node.new("Movie", 20))

    assert_equal node1.count_children, 4
  end

  def test_that_health_returns_report_at_level
    node1 = Node.new("Movie", 12)
    node1.insert(Node.new("Movie", 10))
    node1.insert(Node.new("Movie", 40))
    node1.insert(Node.new("Movie", 20))

    assert_equal node1.health(0), [[12, 4]]
  end

end
