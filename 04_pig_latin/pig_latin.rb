def translate(phrase)
  phrase.split(/ /).each do |word|
    move_consonants_to_end word
    add_ay word
  end.join(' ')
end

def add_ay(word)
  word.gsub!(/^(.*)$/, '\1ay')
end

def move_consonants_to_end(word)
  word.gsub!(/^(([bcdfghjklmnprstvwxyz]|qu)+)(.*)$/, '\3\1')
end
