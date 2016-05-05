def substrings string, dictionary
  full_words = string.split(" ")
  matches    = Hash.new(0)

  dictionary.each do |word|
    
    # Compare all words in string to regex of dictionary word
    full_words.each do |input|
      if input =~ /#{word}/
        matches[word] += 1
      end
    end
  end
  matches
end