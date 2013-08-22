def binary_search(search_term, array)
  first = 0
  last = array.size
  while last > first
    middle = first + (last - first) / 2
    if array[middle] == search_term
      return middle
    elsif array[middle] < search_term
      first = middle + 1
    elsif array[middle] > search_term
      last = middle
    end
  end
  return -1
end

p binary_search(31, [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]) # => nil

test_array = (100..200).to_a
puts binary_search(135, test_array) == 35
# => true

test_array = [13, 19,  24,  29,  32,  37,  43]
puts binary_search(35, test_array) == -1
# => true
