# Solution for Challenge: Anagrams 1: Detecting Anagrams. Started 2013-05-16T01:06:38+00:00

def is_anagram?(word_1, word_2)
  canonical(word_1) == canonical(word_2)
end

def canonical(word)
  word.downcase.split('').sort
end

is_anagram?("Cinema","iceman") # => true
is_anagram?("cinema","korean") # => false

# Canonical is a great idea because it follows the programming principle of DRY (Don't Repeat Yourself)
