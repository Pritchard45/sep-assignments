def heap_sort(array)
  (1..array.length - 1).each do |i|
    #move element to create max heap
    child = i
    while child > 0
      parent = (child -1) / 2
      if array[parent] < array[child]
        temp = array[parent]
        array[parent] = array[child]
        array[child] = temp
        child = parent
      else
        break
      end
    end
  end

  # sort
  i = array.length - 1
  # swap max value at end of array
  while i > 0
     temp = array[0]
      array[0] = array[i]
      array[i] = temp
        i -= 1
        parent = 0
        while parent * 2 + 1 <= i
          #left
          child = parent * 2 + 1
          # left child is empty and left child is less than right child use right
          if child < i && array[child] < array[child + 1]
            child += 1
          end

          if array[parent] < array[child]
            temp = array[child]
            array[child] = array[parent]
            array[parent] = temp
            parent = child
          else
            break
          end
        end
      end
      array
end

# array = [1,4,22,32,5,6,11,23,45]
#
# puts "#{heap_sort(array)}"
