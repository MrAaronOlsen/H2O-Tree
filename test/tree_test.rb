require './test/test_helper'

class TreeTest < Minitest::Test

  attr_reader :b_tree

  def setup
    @b_tree = Tree.new
    @node1 = Node.new("Movie", 12)
    @node2 = Node.new("Movie", 10)
    @node3 = Node.new("Movie", 14)
    @node4 = Node.new("Movie", 11)
    @node5 = Node.new("Movie", 8)
    @node6 = Node.new("Movie", 20)
    @node7 = Node.new("Movie", 30)
    @node8 = Node.new("Movie", 17)
    @node9 = Node.new("Movie", 19)
    @node10 = Node.new("Bomb!", 15)

    b_tree.insert(@node1)
    b_tree.insert(@node2)
    b_tree.insert(@node3)
    b_tree.insert(@node4)
    b_tree.insert(@node5)
    b_tree.insert(@node6)
    b_tree.insert(@node7)
    b_tree.insert(@node8)
    b_tree.insert(@node9)
    b_tree.insert(@node10)

  end

  def test_that_it_is_a_binary_search_tree
    is_a_tree = Tree.new
    assert_instance_of Tree, is_a_tree
  end

  def test_that_head_is_leaf_when_created
    leaf_tree = Tree.new
    assert_instance_of Leaf, leaf_tree.head
  end

  def test_that_head_becomes_node_on_initial_insert
    first_insert_tree = Tree.new
    first_insert_tree.insert(Node.new)
    assert_instance_of Node, first_insert_tree.head
  end

  def test_that_depth_of_returns_false_when_no_head
    empty_tree = Tree.new
    refute empty_tree.depth_of(Node.new)
  end

  def test_that_depth_of_returns_zero_when_only_head_exists
    only_head_tree = Tree.new
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

  def test_that_insert_returns_depth_of_inserted_key_value
    assert_equal b_tree.insert("Movie", 7), 3
  end

  def test_that_fetch_node_gets_correct_node
    assert_equal b_tree.fetch_node(14), @node3
  end

  def test_that_it_replaces_with_correct_node_left
    replaced = b_tree.delete(14)

    assert_equal replaced.first.value, 15
    assert_equal replaced.first.key, 'Bomb!'

    assert_equal replaced.last.value, 14
    assert_equal replaced.last.key, 'Movie'
  end

  def test_that_it_replaces_with_correct_node_right
    @node6.key = 'Bomb!'
    replaced = b_tree.delete(20)

    assert_equal replaced.first.value, 30
    assert_equal replaced.first.key, 'Movie'

    assert_equal replaced.last.value, 20
    assert_equal replaced.last.key, 'Bomb!'
  end

  def test_that_it_deletes_correct_node
    b_tree.delete(14)
    refute b_tree.include?(14)
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

  def test_that_max_returns_max
    assert_equal b_tree.max, 30
  end

  def test_that_min_returns_min
    assert_equal b_tree.min, 8
  end

  def test_that_sort_returns_sorted_array_of_hashes
    assert_equal b_tree.sort, [ {"Movie"=>8},  {"Movie"=>10}, {"Movie"=>11},
                                {"Movie"=>12}, {"Movie"=>14}, {"Bomb!"=>15},
                                {"Movie"=>17}, {"Movie"=>19}, {"Movie"=>20},
                                {"Movie"=>30} ]
  end

  def test_load_returns_number_of_inserts
    tree = Tree.new
    assert_equal tree.load('./lib/movies.txt'), 99
  end

  def test_that_leaves_returns_num_of_leafs
    assert_equal b_tree.leaves, 11
  end

  def test_that_health_returns_report
    assert_equal b_tree.health(1), [[10, 3, 30], [14, 6, 60]]
  end

end
