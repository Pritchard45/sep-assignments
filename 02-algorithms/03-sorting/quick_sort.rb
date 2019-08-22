# def quick_sort(array)
#   if array.length <= 1
#     array
#   else
#     pivot = array.sample # random element
#     array.delete_at(array.index(pivot))
#     less = []
#     greater = []
#
#     array.each do |x|
#       if x <= pivot
#         less << x
#       else
#         greater << x
#       end
#     end
#
#     sorted = []
#     sorted << quick_sort(less)
#     sorted << pivot
#     sorted << quick_sort(greater)
#
#     sorted.flatten
#   end
# end
#
#
#
# sort = [2,3,56,77,44,11,22,66,55,111,33,220,113,117,134]
#
# sorted = quick_sort(sort)
# puts sorted
#

# class QuickSort
#   attr_reader :array
#
# def initialize(array)
#   @array = array
# end
#
#   def quick_sort(left = 0, right = array.size - 1)
#     if left < right
#       p_index = rand(left..right)
#       new_pivot_index = partition(left, right, p_index)
#       quick_sort(left, new_pivot_index -1)
#       quick_sort(new_pivot_index + 1, right)
#     end
#     array
#   end
#
#   def partition(left, right, p_index)
#     pivot = array[p_index]
#     array[p_index], array[right] = array[right], array[p_index]
#     new_pivot_index = left
#     (left..right - 1).each do |i|
#       if array[i] <= pivot
#         array[i], array[new_pivot_index] = array[new_pivot_index], array[i]
#         new_pivot_index += 1
#       end
#     end
#     array[new_pivot_index], array[right] = array[right], array[new_pivot_index]
#     new_pivot_index
#   end
# end
#
# array_1 = [5,1,3,2,4]
#
# sorted = array_1.quick_sort

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))

    return *left.quicksort, pivot, *right.quicksort
  end
end


arr = [34, 2, 1, 5, 3]
p arr.quicksort
