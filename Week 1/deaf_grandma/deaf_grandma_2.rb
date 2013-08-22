def deaf_grandma
  greeting
  answer = gets.chomp
  counter = 0

  while answer != "I LOVE YA" || counter == 2
    if answer == ""
      counter += 1
    elsif answer != answer.upcase
      speak_up
      counter = 0
    elsif answer == answer.upcase
      grandma_response
      counter = 0
    else
      counter += 1
    end
    answer = gets.chomp
  end
end

def greeting
  puts "HIYA, SONNY!"
end

def speak_up
  puts "HUH?! SPEAK UP SONNY!"
end

def grandma_response
  puts "NO, NOT SINCE 1938!"
end

def good_bye
  puts "CALL AGAIN"
end

def grumpy_grandma
  puts "RESPECT YOUR ELDERS!? SONNY"
end

deaf_grandma

