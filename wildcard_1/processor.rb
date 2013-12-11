def number_of_combinations(number)
  product = 1
  5.times do
    product *= number
    number -= 1
  end
  product
end

def space_accumulator(*rows_and_columns)
  sum = 0
  rows_and_columns.each do |rows_or_columns|
    rows_or_columns.each {|x| sum += number_of_combinations(x)}
  end
  sum
end

def reject_less_than_minimum(spaces_in_rows, spaces_in_columns, min)
  spaces_in_rows =spaces_in_rows.reject{|x| x<min}
  spaces_in_columns =spaces_in_columns.reject{|x| x<min}
  [spaces_in_rows,spaces_in_columns]
end

def count_spaces(input_array, column_array)
  [column_array.map {|row| row.count('*')}, input_array.map {|row| row.count('*')}]
end

def read_input(input_file)
  input_array = []
  IO.foreach(input_file) {|x| input_array <<  x.chomp }
  input_array
end

def read_columns(input_array)
  column_array = []
  input_array.first.length.times do |count|
    input_array.each do |row|
      column_array << row[count]
    end
    column_array << "/"
  end
  column_array = column_array.join.split('/')
end

def run_all
  input_array = read_input("input.txt")
  column_array = read_columns(input_array)
  spaces_in_columns, spaces_in_rows = count_spaces(input_array, column_array)
  spaces_in_rows, spaces_in_columns = reject_less_than_minimum(spaces_in_rows,spaces_in_columns,5)
  sum = space_accumulator(spaces_in_rows, spaces_in_columns)
  print "The total combinations are: #{sum}!"
end
run_all
#167160 total combinations!
