class Series
  attr_reader :digits

  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(dig)
    raise ArgumentError.new if dig > digits.size
    digits.each_cons(dig).to_a
  end
end