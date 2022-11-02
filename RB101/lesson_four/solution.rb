
  def sum_even_number_row(row_number)
    rows = []
    row_count = 2
    (1..row_number).each do |current_row_number|
      rows << create_row(row_count, current_row_number)
      row_count = rows.last.last + 2
    end
    rows[-1].reduce(:+)
  end


  def create_row(starting_integer, row_length)
    row = []
    current_integer = starting_integer
     loop do
       row << current_integer
       current_integer += 2
       break if row.length == row_length
     end
    row
  end



  p sum_even_number_row(1) == 2
  p sum_even_number_row(2) == 10
  p sum_even_number_row(4) == 68
  p sum_even_number_row(5) == 130
=begin
  p create_row(2, 1) == [2]
  p create_row(4, 2) == [4, 6]
  p create_row(8, 3) == [8, 10, 12]
=end
