# 1. Define enumerable methods

# Array#map definition:

# Creates a new array with the values passed in from an execution block. Used to
# update each element of an array. Also has a destructive variant that modifies
# source array.

# Array#inject definition:

# Enumerable method that summarizes/accumulates the elements of an array by an 
# execution block or a symbol that names a method or operator.

# Array#select definition:

# Checks the values of an array for matching values of a block, and returns 
# an array. Typically used to pull items out of an array. 
# Shares some common functionality with Enumerable#reject, and #find_all

# -----------
# 2. Write your own method `Array#my_map`
#
# Here is a template to start with:
class Array
  def my_map
    self.collect.each do |i|
      yield(i)
    end
  end
end

puts [1,2,3,4].my_map { |i| i -= 1 }  == [0,1,2,3] # makes you count like a programmer!

# add your own test here

puts [29,70,89].my_map { |i| i += 2 } == [31,72,91]
puts ["Mark","is","learning","Ruby"].my_map { |i| i + " shama-lama"}  == ["Mark shama-lama","is shama-lama","learning shama-lama", "Ruby shama-lama"]

