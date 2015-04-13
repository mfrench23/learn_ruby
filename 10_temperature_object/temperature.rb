class Temperature
  def initialize(optionHash = {})
    @options = optionHash
  end
  
  def in_fahrenheit
    if @options.has_key?(:f)
      @options[:f]
    else
      if @options.has_key?(:c)
	ctof(@options[:c])
      end
    end
  end
  
  def in_celsius
    if @options.has_key?(:f)
      ftoc(@options[:f])
    else
      if @options.has_key?(:c)
	@options[:c]
      end
    end
  end
  
  def self.from_celsius(c)
    Temperature.new( :c => c )
  end
  
  def self.from_fahrenheit(f)
    Temperature.new( :f => f )
  end
  
  private
  
  def ftoc(f)
    (f-32.0)*(5.0/9.0)
  end

  def ctof(c)
    c*(9.0/5.0)+32.0
  end  
end

class Celsius < Temperature
  def initialize(c)
    super({ :c => c})
  end
end

class Fahrenheit < Temperature
  def initialize(f)
    super({ :f => f})
  end
end
