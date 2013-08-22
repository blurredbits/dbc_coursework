def deaf_grandma(input)
  puts "Hi, grandma"
  input = gets.chomp
  counter = 0

  until input == "I LOVE YA" || counter == 1
    if input == ""
      counter += 1
    elsif input == input.upcase
      puts "NO, NOT SINCE 1938"
      counter = 0
    elsif input != input.upcase
      puts "SPEAK UP SONNY"
    end
    input = gets.chomp
  end
  puts "HAVE A NICE DAY SONNY"
end

puts "HI, SONNY - WHAT HAVE YOU GOT TO SAY TO GRANDMA?"
input = gets.chomp
deaf_grandma(input)

