def thousand_lights(num_of_lights)
  lights = {}
  num_of_lights.times {|n| lights[n + 1] = false}

  1.upto(num_of_lights) do |n|
    lights.keys.each do |num|
      lights[num] = !lights[num] if num % n == 0
     end
  end

  lights.keys.select {|key| lights[key]}
end

p thousand_lights(1000)
