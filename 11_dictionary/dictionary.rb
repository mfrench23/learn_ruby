class String
  def to_h
    { self => nil }
  end
end

class Dictionary
  def initialize
    @entries = {}
  end
  
  def entries
    @entries
  end
  
  def add(pair)
    @entries.merge!(pair.to_h)
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