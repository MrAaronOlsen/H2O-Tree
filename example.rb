require './lib/binary_search_tree'
require './lib/node'
require './lib/leaf'

tree = BinarySearchTree.new

puts tree.insert("Bill & Ted's Excellent Adventure", 61)
puts tree.insert("Johnny English", 16)
puts tree.insert("Sharknado 3", 92)
puts tree.insert("Hannibal Buress: Animal Furnace", 50)

puts tree.include?(16)
puts tree.include?(72)

puts tree.depth_of(92)
puts tree.depth_of(50)
puts tree.depth_of(11)