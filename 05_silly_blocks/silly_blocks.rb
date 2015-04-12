def reverser
  yield.split(/ /).each do |word|
    word.reverse!
  end.join(' ')
end

def adder(x=1)
  yield+x
end

def repeater(x=1)
  x.times do  
    yield 
  end
end