def to_roman(num)
  results = ""

  digits = [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100,"C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  digits.each do |number, symbol|
    while num >= number
      results << symbol
      num -= number
    end
  end
  results
end

# Drive code... this should print out trues.

puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"
puts to_roman(4)
puts to_roman(9)
puts to_roman(14)
puts to_roman(44)
puts to_roman(944)
# TODO: what other cases could you add to ensure your to_roman method is working?
