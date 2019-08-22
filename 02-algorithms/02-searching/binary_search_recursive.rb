def recursive_binary_search(array, value)
  #removed include?
  for i in array
    if i === value
      mid_point = (array.length) / 2
      if array[mid_point] == value
        puts "#{value} found"
      elsif array[mid_point] < value
        new_array = array[mid_point..(array.length)].map{|x| x}
        recursive_binary_search(new_array, value)
      elsif array[mid_point] > value
        new_array = array[0..mid_point].map{|x| x}
        recursive_binary_search(new_array, value)
      end
      else
        puts "Not Found #{value}"
    end
  end
end


search_array = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
search_array2 = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 113, 116, 117, 118]



recursive_binary_search(search_array, 1)
# recursive_binary_search(search_array, 4)
# recursive_binary_search(search_array, 10)
# recursive_binary_search(search_array2, 11)
# recursive_binary_search(search_array2, 4)
# recursive_binary_search(search_array2, 116)
# recursive_binary_search(search_array2, 115)
recursive_binary_search(search_array2, 177)
