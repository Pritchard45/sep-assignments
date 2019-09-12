# def ver_two(*arrays)
#   combined_array = arrays.map { |array| array }
#   sorted_array = combined_array.flatten!
#   sorted_array.sort!
# end


def ver_two(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  return merge_sort(combined_array)
end

def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end
