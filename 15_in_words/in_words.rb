class Fixnum
  def in_words
    return "zero" if self == 0
    
    hash = { 1 => "one", 2 => "two",
             3 => "three", 4 => "four", 5 => "five",
             6 => "six", 7 => "seven", 8 => "eight",
             9 => "nine", 10 => "ten", 11 => "eleven",
             12 => "twelve", 13 => "thirteen", 14 => "fourteen",
             15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
             18 => "eighteen", 19 => "nineteen", 20 => "twenty",
             30 => "thirty", 40 => "forty", 50 => "fifty", 
             60 => "sixty", 70 => "seventy", 80 => "eighty",
             90 => "ninety"}
    bigHash = { 100 => "hundred", 1000 => "thousand",
             1000000 => "million", 1000000000 => "billion", 
             1000000000000 => "trillion" }
    
    str = ""
    temp = self
    bigHash.keys.sort.reverse.each do |num|
      if num <= temp
	count = temp / num;
	str += count.in_words + " " + bigHash.fetch(num) + " "
	temp = temp % num
      end
    end
    if temp > 20
      tens = temp/10
      str += hash.fetch(tens*10)
      temp = temp % 10;
      if temp > 0
	str += " " + hash.fetch(temp)
      end
    else
      str += hash.fetch(temp, "")
    end
    
    str.strip
  end
end