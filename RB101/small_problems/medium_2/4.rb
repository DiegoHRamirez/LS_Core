def order?(str)
  open_count, close_count = 0, 0
  str.each_char do |char|
    open_count += 1 if char == '('
    close_count += 1 if char == ')'
    return false if close_count > open_count
  end
  true
end

def matching?(str)
  str.count('()').even? && str.count('(') == str.count(')')
end

def balanced(str)
  if str.count(')(') > 0
    matching?(str) && order?(str) ? true : false
  else
    true
  end
end

def balanced?(string)
  p string.split('(')
  p string.split(')')
  return false if string.split('(').size != string.split(')').size
end




p balanced?(')Hey!(')
p balanced?('What ((is))) up(')
