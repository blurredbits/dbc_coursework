# Solution for Challenge: Recursion vs. Iteration, Benchmarking It. Started 2013-05-15T17:41:08+00:00
def benchmark(times)
  start_time = Time.now
  times.times do
    yield
  end
  end_time = Time.now
  running_time = end_time - start_time
end

def r_fib(n)
  return n if n <= 1
  r_fib(n-2) + r_fib(n-1)
end

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

puts "Recursive fib ran in #{benchmark(1000) {r_fib(10)}} seconds"
puts "Iterative fib ran in #{benchmark(1000) {fib_iterative(10)}} seconds"


# Refactored recursive fibonacci - modified base case conditional (<= vs. ==) and 
# reversed order of recursion calls (-2, -1 vs. -1, -2)
