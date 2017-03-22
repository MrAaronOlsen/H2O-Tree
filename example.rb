require './lib/binary_search_tree'
require './lib/node'

b_tree = BinarySearchTree.new
node1 = Node.new("Movie", 10)
node2 = Node.new("Movie", 11)
node3 = Node.new("Movie", 12)
node4 = Node.new("Movie", 13)
b_tree.insert(node1)
b_tree.insert(node2)
b_tree.insert(node3)
b_tree.insert(node4)

b_tree.display_tree