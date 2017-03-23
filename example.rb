require './lib/binary_search_tree'
require './lib/node'
require './lib/leaf'

require 'pry'

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

puts tree.max
puts tree.min

puts tree.sort

tree = BinarySearchTree.new

puts tree.load('./movies.txt')
puts tree.sort

tree = BinarySearchTree.new

tree.insert("Animals United", 98)
tree.insert("Armageddon", 58)
tree.insert("Bill & Ted's Bogus Journey", 36)
tree.insert("Bill & Ted's Excellent Adventure", 93)
tree.insert("Charlie's Angels", 86)
tree.insert("Charlie's Country", 38)
tree.insert("Collateral Damage", 69)

print tree.health(0); puts ""
print tree.health(1); puts ""
print tree.health(2); puts ""