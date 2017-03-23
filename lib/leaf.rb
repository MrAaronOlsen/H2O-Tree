class Leaf

  def insert(node)
    return node
  end

  def include?(value)
    false
  end

  def depth_of(node, depth = nil)
    nil
  end

  def max(max_value)
    max_value
  end

  def min(min_value)
    min_value
  end

  def leaves(num)
    num+=1
  end

  def count_children(children)
    children
  end

  def health(level, report)
     false
  end

  def sort(array)
    array
  end

end