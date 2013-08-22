# Takes as its input an integer +n+ representing the starting number of bottles
# Prints out the lyrics to "n Bottles of Beer" to the console.

def bottle_song(n)

  n.downto(1) do |i|
    puts "#{i} bottles of beer on the wall, #{i} bottles of beer."
    puts
    if (i - 1) == 0
      puts "Take one down, pass it around, no bottles of beer on the wall!"
    else
      puts "Take one down, pass it around, #{i - 1} bottles of beer on the wall!"
    end
  end
end

bottle_song(5)
