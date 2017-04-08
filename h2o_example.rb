require './lib/tree'
require './lib/node'
require './lib/leaf'

require 'pry'

puts "Test Sequence 1\n\n"
tree = Tree.new

puts "Insert Movies with Depth Returned\n\n"

puts "Bill & Ted's Excellent Adventure, 61: Depth => #{tree.insert("Bill & Ted's Excellent Adventure", 61)}"
puts "Johnny English, 16: Depth => #{tree.insert("Johnny English", 16)}"
puts "Sharknado 3, 92: Depth => #{tree.insert("Sharknado 3", 92)}"
puts "Hannibal Buress: Animal Furnace, 50: Depth => #{tree.insert("Hannibal Buress: Animal Furnace", 50)}"

puts "\nDo Files Exist?"
puts "Find 16: #{tree.include?(16)}"
puts "Find 72: #{tree.include?(72)}"

puts "\nFind Depth of Values"
puts "92: #{tree.depth_of(92)}"
puts "50: #{tree.depth_of(50)}"
puts "11: #{tree.depth_of(11)}"

puts "\nFind Max Value: #{tree.max}"
puts "Find Min Value: #{tree.min}"

puts "\nSort Tree\n\n"
puts tree.sort

puts "\nTest Sequence 2"

tree = Tree.new

puts "\nLoad Movies.txt"
puts "Number of Inserts: #{tree.load('./lib/movies.txt')}"
puts "\nSorted Tree\n\n"
puts tree.sort

tree = Tree.new

puts "\nTest Sequence 3\n\n"

print "Inserting:"
puts "\tAnimals United, 98"
puts "\t\tArmageddon, 58"
puts "\t\tBill & Ted's Bogus Journey, 36"
puts "\t\tBill & Ted's Excellent Adventure, 93"
puts "\t\tCharlie's Angels, 86"
puts "\t\tCharlie's Country, 38"
puts "\t\tCollateral Damage, 69"

tree.insert("Animals United", 98)
tree.insert("Armageddon", 58)
tree.insert("Bill & Ted's Bogus Journey", 36)
tree.insert("Bill & Ted's Excellent Adventure", 93)
tree.insert("Charlie's Angels", 86)
tree.insert("Charlie's Country", 38)
tree.insert("Collateral Damage", 69)

system 'clear'
puts "Head: #{tree.head.key} #{tree.head.value}"
puts "Number of Nodes: #{tree.count_nodes}"
puts "Health Level 1: #{tree.health(1)}"
puts "Number of Leafs: #{tree.leaves}"
puts "Sorted List:\n\n"
puts tree.sort
puts "\nDelete Node: #{tree.fetch_node(58).key} #{tree.fetch_node(58).value}"
deleted = tree.delete(58)
print "\n#{deleted[1].key} #{deleted[1].value} swapped with "
puts "\n#{deleted[0].key} #{deleted[0].value} and replaced by leaf."

puts "\nHead: #{tree.head.key} #{tree.head.value}"
puts "Number of Nodes: #{tree.count_nodes}"
puts "Health Level 1: #{tree.health(1)}"
puts "Number of Leafs: #{tree.leaves}"
puts "Sorted List:\n\n"
puts tree.sort

puts "\nHealth of Tree"
puts "\nLevel 0: #{tree.health(0)}"
puts "Level 1: #{tree.health(1)}"
puts "Level 2: #{tree.health(2)}\n\n"

puts "Number of Leaves: #{tree.leaves}"