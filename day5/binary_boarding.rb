seat = 0

File.foreach("./input") do |line|
  min_row = 0
  max_row = 127
  min_col = 0
  max_col = 7
  col = 0
  row = 0

  row_values = line[0..6]
  column_values = line[7..9]

  row_values.split("").each do |c|
    half = ((max_row - min_row )/2.0)
    if c == "F"
      max_row = max_row - half.ceil
      row = max_row
    elsif c == "B"
      min_row = min_row + half.ceil
      row = min_row
    end
  end
  column_values.split("").each do |c|
    half = ((max_col - min_col) / 2.0)
    if c == "L"
      max_col = max_col - half.ceil
      col = max_col
    elsif c == "R"
      min_col = min_col + half.ceil
      col = min_col
    end
  end
  next_seat = row * 8 + col
  if next_seat > seat
    seat = next_seat
  end
end

puts "The highest seat ID is: #{seat}"
