BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
  !!BLOCKS.each {|block| return false if str.upcase.count(block) > 1}
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
