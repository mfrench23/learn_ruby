class Fixnum
  def in_words
    return "zero" if self == 0
    
    str = ""
    
    temp = self
    if temp >= 100
      bigHash = namesBigNumbers
      bigHash.keys.sort.reverse.each do |num|
	temp, str = wordsForBigNumber(num, temp, str, bigHash)
      end
    end
    
    if temp > 0
      hash = namesUnder100
      if temp > 20
	str = wordsFor20Through99(temp, str, hash)
      else
	str += hash.fetch(temp)
      end
    end
    
    str.strip
  end
  
  private 
  
  def wordsFor20Through99(temp, str, hash)
    tens = temp/10
    str += hash.fetch(tens*10)
    temp = temp % 10;
    str += " " + hash.fetch(temp) unless temp == 0
    str
  end
  
  def wordsForBigNumber(namedBigNumber, counter, words, bigHash)
    if namedBigNumber <= counter
      count = counter / namedBigNumber;
      words += count.in_words + " " + bigHash.fetch(namedBigNumber) + " "
      counter = counter % namedBigNumber
    end
    return counter, words
  end
  
  def namesUnder100
    { 1 => "one", 2 => "two",
      3 => "three", 4 => "four", 5 => "five",
      6 => "six", 7 => "seven", 8 => "eight",
      9 => "nine", 10 => "ten", 11 => "eleven",
      12 => "twelve", 13 => "thirteen", 14 => "fourteen",
      15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
      18 => "eighteen", 19 => "nineteen", 20 => "twenty",
      30 => "thirty", 40 => "forty", 50 => "fifty", 
      60 => "sixty", 70 => "seventy", 80 => "eighty",
      90 => "ninety"}
  end
  
  def namesBigNumbers
    { 100 => "hundred", 1000 => "thousand",
      1000000 => "million", 1000000000 => "billion", 
      1000000000000 => "trillion" }
  end
end