def translate(phrase)
  phrase.split(/ /).each do |word|
    squash_qu word
    move_consonants_to_end word
    add_ay word
    expand_qu word
  end.join(' ')
end

def add_ay(word)
  word.gsub!(/^(.*)$/, '\1ay')
end

def move_consonants_to_end(word)
  word.gsub!(/^([^aeiou]*)(.*)$/, '\2\1')
end

def squash_qu(word)
  # Text being converted to pig latin is unlikely
  # to include the infinity symbol...
  word.gsub!(/qu/, 'Ꝏ')
end

def expand_qu(word)
  word.gsub!(/Ꝏ/, 'qu')
end


