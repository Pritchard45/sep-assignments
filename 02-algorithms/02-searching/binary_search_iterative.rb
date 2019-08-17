def iterative_binary_search(array, value)
  #index set to the first value in collection
  low = 0
  high = array.length - 1

#while loop to iterate stopping once when low > high
# Low will only be > high if value not present
  while low <= high
    #mid is sit to low + high divedd by wo to get the middle index
    mid = (low + high) /2
    if array[mid] > value
      # if the mid value is > value then the value is in the lower half
      # of the collection
      high = mid - 1
    elsif array[mid] < value
      # if the mid value is < value then the value is in the upper half
      #of the collection
      low = mid + 1
    else
      # return mid because we know that the mid value = value
      return puts "Found #{value}"
    end

  end
  # if value not found
    return puts "Not Found #{value}"
end


search_array = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
search_array2 = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 113, 116, 117, 118]



iterative_binary_search(search_array, 1)
iterative_binary_search(search_array, 4)
iterative_binary_search(search_array, 10)
iterative_binary_search(search_array2, 11)
iterative_binary_search(search_array2, 4)
iterative_binary_search(search_array2, 116)
iterative_binary_search(search_array2, 115)
iterative_binary_search(search_array2, 182)
