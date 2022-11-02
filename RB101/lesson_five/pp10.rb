arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


arr2 = arr.map do |hash|
        hash.each_with_object({}) do |(key, value), hash|
          hash[key] = value + 1
        end
      end

p arr2


a = arr.map do |hash|
    hash_plus_one = {}
    hash.each do |k, v|
      hash_plus_one[k] = v + 1
    end
    hash_plus_one
  end

p a