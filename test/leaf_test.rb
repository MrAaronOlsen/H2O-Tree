require './test/test_helper'

class LeafTest < Minitest::Test

  def test_that_it_is_a_leaf
    leaf = Leaf.new
    assert_instance_of Leaf, leaf
  end

  def test_that_insert_returns_node_that_is_sent_to_it
    leaf = Leaf.new
    assert_instance_of Node, leaf.insert(Node.new)
  end

  def test_that_delete_returns_false
    leaf = Leaf.new
    refute leaf.delete(Node.new)
  end

  def test_that_replace_returns_false
    leaf = Leaf.new
    refute leaf.replace(Node.new)
  end

  def test_that_include_returns_false
    leaf = Leaf.new
    refute leaf.include?(10)
  end

  def test_that_depth_of_returns_false
    leaf = Leaf.new
    refute leaf.depth_of(Node.new, 10)
  end

  def test_that_max_returns_value
    leaf = Leaf.new
    assert_equal leaf.max(10), 10
  end

  def test_that_min_returns_value
    leaf = Leaf.new
    assert_equal leaf.min(9), 9
  end

  def test_that_leaves_adds_to_total_leaves
    leaf = Leaf.new
    assert_equal leaf.leaves(0), 1
  end

  def test_that_count_children_returns_value
    leaf = Leaf.new
    assert_equal leaf.count_children(8), 8
  end

  def test_that_health_returns_false
    leaf = Leaf.new
    refute leaf.health(9, [])
  end

  def test_that_sort_returns_array
    leaf = Leaf.new
    array = 10.times.map { Node.new }

    assert_equal leaf.sort(array), array
  end

  def test_that_remove_child_returns_node
    leaf = Leaf.new
    child = Node.new

    assert_equal leaf.remove_child(child), child
  end

end