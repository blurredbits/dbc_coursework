def fib_iterative(number)
  return number if number <= 1
  fib_array = [0,1]
  (2..number).each do
    new_fib_num = fib_array[0] + fib_array[1]
    fib_array.shift
    fib_array << new_fib_num
  end
  fib_array[1]
end

def fib_recursive(number)
  puts number
  return number if number <= 1
  puts "#{number}, #{fib_recursive(number-1)}, #{fib_recursive(number-2)}"
  fib_recursive(number-1) + fib_recursive(number-2) if number > 1
end

p fib_iterative(0) == 0
p fib_iterative(1) == 1
p fib_iterative(2) == 1
p fib_iterative(3) == 2
p fib_iterative(4) == 3
p fib_iterative(5) == 5


p fib_recursive(5) == 5
# etc…
