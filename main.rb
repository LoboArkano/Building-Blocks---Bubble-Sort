def bubble_sort(array)
  if array.length <= 1
    return array
  end

  previous_index = 0
  next_index = 1
  0.upto(array.length - 1) do
    array.each_with_index do |_x, index|
      previous_index = index
      next_index = index + 1
      break if next_index == array.length

      if array[previous_index] > array[next_index]
        array[previous_index], array[next_index] = array[next_index], array[previous_index]
      end
    end
  end
  return array
end

def bubble_sort_by(array)
  0.upto(array.length - 1) do
    array.each_with_index do |_x, index|
      next_index = index + 1
      break if next_index == array.length

      if yield(array[index], array[index + 1]).positive?
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
  end
  puts array
end

print bubble_sort([6, 2, 3, 7, 4, 8, 5])

puts

bubble_sort_by(%w(hi hello y hey)) do |left,right|
  left.length - right.length
end
