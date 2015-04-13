class Timer
  def initialize
    @seconds = 0
  end
  
  def seconds=(val)
    @seconds = val
  end
  
  def seconds
    @seconds
  end
  
  def time_string
    hrs = "%02d" % (@seconds / (60*60))
    sec = @seconds % (60*60)
    min = "%02d" % (sec / 60)
    sec = "%02d" % (sec % 60)
    "#{hrs}:#{min}:#{sec}"
  end
end