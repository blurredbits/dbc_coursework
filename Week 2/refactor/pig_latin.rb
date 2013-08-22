# Determine if sentence or word
# If sentence, separate word.
#   For each word, translate
# If word, translate.
#
# Pig Translation
# if word starts with vowel, keep as is
# if consonant, translate

def convert_to_piglatin(word)
  input_array = word.split(" ")
  input_array.each do |input_word|
    translate(input_word)
  end
end

def translate(word)
  ans = []
  word =~ /[aeiou]/
  ans << "#{$&.downcase}#{$'.downcase}#{$`.downcase}ay"
end

convert_to_piglatin(gets.chomp)
p ans
