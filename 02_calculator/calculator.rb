def add(x,y)
  x+y
end

def subtract(x,y)
  x-y
end

def sum(array)
  s = 0
  array.each { |x| s += x }
  s
end

def multiply(x, *rest)
  s = x
  rest.each{ |y| s *= y }
  s
end

def power(x,y)
  x**y
end

def factorial(x)
  if x == 0
    y = 1
  else
    y = x * factorial(x-1)
  end
  y
end    