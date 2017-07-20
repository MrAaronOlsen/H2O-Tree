## H2O Tree
An example binary search tree written in Ruby.

#### Setup
Once cloned:
``` bash
$ bundle install
$ rake test
```
If all goes well you're good to go.

#### Notes
H2O uses only recursion to crawl the tree, which is cool, but ultimately limited in this case. Eventually the stack will go too deep and your computer will crash because it ran out of memory. This could be fixed, but I have bigger fish to fry.

The tree is only useful for lists with a unique 'value'. This could be an index, but more likely a score or something. In my mind this would be handy for phone numbers, social security numbers, etc.. Since the tree is sorted by the value all values must be unique. In my case this might be handy in making an AABB Tree for 2d broad phase collision detection.

#### Use
H2O Tree is pretty simple. You make a Tree and insert Nodes into it.

Nodes hold a 'key' and 'value'. The tree is sorted by the value, which may sound backwards, but there you go. The key can hold anything you want, the value must be unique.
```Ruby
node = Node.new('key', 1)
```
Trees are built by inserting nodes into an instance.

```Ruby
b_tree = Tree.new

10.times do |i|
  b_tree.insert(Node.new('key', i))
end
```
Alternatively you can insert a key | value pair and a node will be made for you.
```Ruby
b_tree = Tree.new

10.times do |i|
  b_tree.insert('key', i)
end
```
These examples would of course make a very right heavy tree, but that's the idea.

Functions available on the Tree class

> .insert(node) or insert(key, value)

```Ruby
result = tree.insert(node)
result = depth of node inserted
```
Inserts node into tree based on value.

> .delete(value)

```Ruby
result = tree.delete(value)

result.first = deleted node
result.second = swapped node
```
Removes the node with the given value and returns an array with [deleted node, moved node]. This function automatically restructures the tree by replacing the deleted node with the smallest value child node. It does not replace the instance of the node, but instead swaps the value and key of the nodes and deletes the instance of the swapped node by replacing it with a leaf. [Check this out for more on how that works](http://www.algolist.net/Data_structures/Binary_search_tree/Removal).

> .fetch_node(value)

Returns a node object with the given value.

> .include?(value)

Returns true or false if value lives in tree.

> .depth_of(node)

Returns the depth of the given node in the tree.

> .max

Returns the max value in the tree.

> .min

Returns the min value in the tree.

> .leaves

Returns total count of leaves, or end points, in the tree.

> .health(depth)

```Ruby
report = tree.health(1)

report = [[10, 3, 30], [14, 6, 60]]
where [value of parent, number of children, percent of total children]
```
Takes a depth and returns a report on the health of tree. Report is an array of arrays where each nested array is a parent on the depth sent. This can be used to see of tree is getting tipsy.

 > .count_nodes

 Returns total number of nodes in tree.

 > .sort

```Ruby
result = tree.sort

result = [{key, value}, {key, value}]
```
 Returns a sorted array of all nodes in key | value hashes.

 > .load(file.txt)

 Will load a txt file and build tree returning number of nodes inserted. File must be formatted like

 ```
 34, 'Stuff'
 13, 'More Stuff'
 ```