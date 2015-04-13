def measure(reps=1)
  return 0 if reps == 0
  
  t = Time.now
  reps.times do
    yield
  end
  (Time.now - t)/reps
end