def quick_sort(array)
  if array.length <= 1
    array
  else
    pivot = array.last
    less = []
    more = []
    array.pop
    array.each do |x|
      x <= pivot ? less.push(x) : more.push(x)
    end
    return quick_sort(less) + [pivot] + quick_sort(more)
  end
end


# search_1 = [0,12,23,34,5,6,1,23,234,2]
# search_2 = [0,1,2,3,4,5,6,7,8,9,]
# search_3 = [2,3,56,77,44,11,22,66,55,88,99,111,33,220,113,117,134]
#
# sorted = quick_sort(search_3)
# puts sorted
#
# puts "\n"
#
# sorted = quick_sort(search_1)
# puts sorted
#
# puts "\n"
#
# sorted = quick_sort(search_2)
# puts sorted
