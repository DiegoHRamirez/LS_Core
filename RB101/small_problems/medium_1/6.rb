
def minilang(string)
  stack = []
  reg_val = 0

  string.split(' ').each do |cmd|
      case cmd
      when 'PUSH' then stack.push(reg_val)
      when 'ADD' then reg_val += stack.pop
      when 'SUB' then reg_val -= stack.pop
      when 'MULT' then reg_val *= stack.pop
      when 'DIV' then reg_val /= stack.pop
      when 'MOD' then reg_val %= stack.pop
      when 'POP' then reg_val = stack.pop
      when 'PRINT' then puts reg_val
      when 'P' then p stack
      else reg_val = cmd.to_i
      end
  end
end


minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
