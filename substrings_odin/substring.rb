def substrings text, dictionary
  text = text.downcase!.gsub(/[^a-z0-9\s]/i, '').split(' ')
  subs = Hash.new
  text.each do |text_word|
    dictionary.each do |dictionary_word|
      if text_word.include?(dictionary_word)
        subs.has_key?(dictionary_word) ? subs[dictionary_word] += 1 : subs[dictionary_word] = 1
      end
    end
  end
  return subs
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
