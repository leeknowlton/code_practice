def cipher string, shift_factor
  uppercase = [*"A".."Z"].reverse
  lowercase = [*"a".."z"].reverse
  new_string = []

  puts string
  string.split(" ").each do |word|
    new_word = []
    word.each_char.each do |c|
      if uppercase.include?(c)
        new_word << (uppercase[uppercase.index(c) - shift_factor])
      elsif lowercase.include?(c) 
        new_word << (lowercase[lowercase.index(c) - shift_factor])
      else
        new_word << c
      end
    end
    new_string << new_word.join("")
  end
  new_string.join(" ") 
end

puts cipher("What a string!", 5)