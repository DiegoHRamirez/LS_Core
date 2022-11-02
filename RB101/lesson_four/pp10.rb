
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def get_age_group(hash)
  case hash['age']
  when 0..17 then 'kid'
  when 18..64 then 'adult'
  else 'senior'
  end
end

p munsters.each { |name, stats| stats['age_group'] = get_age_group(stats) }

=begin

munsters =  {"Herman"=> {"age"=>32, "gender"=>"male", "age_group"=>"adult"},
            "Lily"=> {"age"=>30, "gender"=>"female", "age_group"=>"adult"},
            "Grandpa"=>{"age"=>402, "gender"=>"male", "age_group"=>"senior"},
            "Eddie"=> {"age"=>10, "gender"=>"male", "age_group"=>"kid"},
            "Marilyn"=> {"age"=>23, "gender"=>"female", "age_group"=>"adult"}}
=end