def bucket_sort(array, bucket_size = 5)
  if array.length <= 1
    array
  end

  min = array.min
  max = array.max

  bucket_count = ((max - min) / bucket_size).ceil + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  array.each do |item|
    buckets[((item - min)/ bucket_size).floor] << item
  end

  sort_arr = []
  buckets.each do |bucket|
    new = insertion_sort(bucket)
    sort_arr.concat(new)
  end
  sort_arr
end

def insertion_sort(collection)
  sorted_array = [collection.delete_at(0)]

  until collection.length == 0
    insert_value = collection.shift
    i = 0
    until i == sorted_array.length || insert_value < sorted_array[i]
      i += 1
    end
    sorted_array.insert(i, insert_value)
  end

  sorted_array
end

array = [3,4,5,6,7,10,11,9,8]
puts "#{bucket_sort(array)}"
