# Solution for Challenge: Anagrams 2: Generating Anagrams. Started 2013-05-16T01:15:20+00:00

def anagrams_for(word, dictionary)
  result = []
  dictionary.each do |dictionary_word|
    if is_anagram?(dictionary_word, word)
      result << dictionary_word
    end
  end
  return result
end


def is_anagram?(word_1, word_2)
  canonical(word_1) == canonical(word_2)
end

def canonical(word)
  word.downcase.split('').sort
end

# Psuedo code -->
# Create a collection to hold the results
# For each word in the dictionary
#   check if the word is an anagram
#     if anagram add to the results collection
# Return the collection

# The dictionary is just an arbitrary collection of strings.
# It need not contain English words, e.g., 'etlsm'.
dictionary = ['acres', 'cares', 'Cesar', 'races', 'smelt', 'melts', 'etlsm']

# If the input word happens to be in the dictionary, it should be in the the returned array, too.
# The list should also be case-insensitive.
anagrams_for('acres', dictionary)   # => ["acres", "cares", "Cesar", "races"]
anagrams_for('ACRES', dictionary)   # => ["acres", "cares", "Cesar", "races"]
anagrams_for('Cesar', dictionary)   # => ["acres", "cares", "Cesar", "races"]

# Although "sacre" is not *in* the dictionary, several words in the dictionary are anagrams of "sacre"
anagrams_for('sacre', dictionary) # => ["acres", "cares", "Cesar", "races"]

# Neither the input word nor the words in the dictionary need to be valid English words
anagrams_for('etlsm', dictionary) # => ["smelt", "melts", "etlsm"]

anagrams_for('unicorn', dictionary) # => []
# >> ["smelt", "melts", "etlsm"]
