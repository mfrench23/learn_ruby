def echo(input)
  input
end

def shout(input)
  input.upcase
end

def repeat(input, times=2)
  ((input + " ") * times).strip
end

def start_of_word(word, how_many_letters)
  word[0, how_many_letters]
end

def first_word(phrase)
  phrase[0, phrase.index(" ")]
end

def titleize(phrase)
  phrase.split(/ /).each_with_index do |word, index|
    if(index == 0 or (word != 'and' and word != 'the' and word != 'over'))
      word.capitalize!
    end
  end.join(' ')
end