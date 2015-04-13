class RPNCalculator
  def initialize
    @stack = []
  end
  
  def push(val)
    @stack.push(val)
  end
  
  def value
    @stack.last
  end
  
  def plus
    x, y = pop_two
    push(x+y)
  end
  
  def minus
    x, y = pop_two
    push(y-x)
  end
  
  def divide
    x, y = pop_two
    push(y.to_f/x.to_f)
  end
  
  def times
    x, y = pop_two
    push(x*y)
  end
  
  def tokens(str)
    tok = str.split(/ /)
    tok.each_with_index do |t, i|
      case 
	when t =~ /^[0-9]*$/
	  tok[i] = t.to_i
	else
	  tok[i] = :"#{t}"
      end
    end
    tok
  end
  
  def evaluate(str)
    tokens = tokens(str)
    tokens.each do |token|
      case
      when token == :+
	plus
      when token == :-
	  minus
      when token == :*
	  times
      when token == :"/"
	divide
      else
	push token
      end
    end
    value
  end

  private
  
  def pop_two
    raise "calculator is empty" if @stack.count == 0
    
    x = @stack.pop
    y = @stack.pop
    return x, y
  end
  
end