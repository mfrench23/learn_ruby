class Dictionary
  def initialize
    @entries = {}
  end
  
  def entries
    @entries
  end
  
  def add(pair)
    if(pair.respond_to?(:keys) and pair.respond_to?(:values))
      @entries.merge!(pair)
    else
      @entries.merge!({pair.to_s => nil})
    end
  end
  
  def keywords
    @entries.keys.sort
  end
  
  def include?(key) 
    @entries.keys.include?(key)
  end
  
  def find(word)
    @entries.select { |k, v| k =~ /^#{word}/ }
  end
  
  def printable
    str = ""
    keywords.each do |k|
      str += "[#{k}] \"#{@entries[k]}\"\n"
    end
    str.chomp!
  end
end