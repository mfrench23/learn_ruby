class Friend
  def greeting(name=nil)
    ["Hello", name].select{ |item| !item.nil? }.join(", ") + "!"
  end
end