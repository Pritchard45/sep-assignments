# def ver_three(*arrays)
#   comined_array = arrays.map { |array| array }
#   return comined_array.flatten!.sort!
# end

def ver_three(*arrays)
  combined_array = []

  arrays.each do |array|
    combined_array += array
  end

  return bubble_sort(combined_array)
end

def bubble_sort(collection)
  n = collection.length
  swapped = true
  while swapped do
    swapped = false
    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        collection[i], collection[i + 1] = collection[i + 1], collection[i]
    swapped = true
      end
    end
  end
  collection
end



# be aware of algorithms
# be aware of algorithms
