class Book
  def title=(value)
    @title = titleize(value)
  end
  
  def title
    @title
  end
  
  private
  
  def titleize(phrase)
    phrase.split(/ /).each_with_index do |word, index|
      if(index == 0 or !word_to_skip(word))
	word.capitalize!
      end
    end.join(' ')
  end
  
  def word_to_skip(word)
    (word == "the" or
     word == "and" or
     word == "in" or 
     word == "of" or
     word == "a" or
     word == "an")
  end
end