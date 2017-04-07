require 'benchmark'
require './lib/tree'

tree = Tree.new

Benchmark.bm(25) do |bm|
  bm.report('Build H2O Tree') { 10000.times { |num| tree.insert('Thing', num) } }
  puts "Tree Size: #{tree.count_nodes}"
  bm.report('Find Values') { 100000.times { |num| tree.include?(num*rand(1..10)) } }
  bm.report('Find Max') { tree.max }
  bm.report('Find Mix') { tree.min }
  bm.report('Delete') { 1.times { |num| tree.delete(num*rand(1..10)) } }
  puts "Tree Size: #{tree.count_nodes}"
end