def ver_one(*arrays)
  combined_array = []

  arrays.each do |array|
    combined_array += array
  end

  sorted_array = [combined_array.delete_at(0)]

  until combined_array.length == 0
    insert_value = combined_array.shift
    i = 0
    until i == sorted_array.length || insert_value < sorted_array[i]
      i += 1
    end
    sorted_array.insert(i, insert_value)
  end

  sorted_array
end
