class XmlDocument
  def initialize(indent=false)
    @indent = indent
    @indentLevel = 0
  end
  
  def method_missing(method_name, *arguments, &block)    
    spaces = "  " * @indentLevel
    @indentLevel += 1
    if block.nil?
      if(@indent) 
        "#{spaces}<#{method_name}#{argument_section(arguments)}/>\n"
      else
	"<#{method_name}#{argument_section(arguments)}/>"
      end
    else
      contents=yield(block)

      if(@indent) 
	"#{spaces}<#{method_name}#{argument_section(arguments)}>\n#{contents}#{spaces}</#{method_name}>\n"
      else
	"<#{method_name}#{argument_section(arguments)}>#{contents}</#{method_name}>"
      end
    end
  end 
  
  def respond_to_missing?(method_name, include_private = false)
    true
  end
  
  private
  
  def argument_section(arguments)
    str = ""
    arguments.each do |hash|
      hash.keys.each do |key|
	str += " #{key}='#{hash[key]}'"
      end
    end
    str
  end
end