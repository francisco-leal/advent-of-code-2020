values = []
sub_results = []
match = nil
value = nil
solution = []
index = 0

File.foreach("./input") do |line|
  value = line.to_i
  sub_results << []

  if values.length > 1
    # calculate
    sub_results.each_with_index do |row, i|
      row.each_with_index do |cell, f|
        if cell + value == 2020
          solution[0] = value
          solution[1] = values[f]
          solution[2] = values[i]
        end
      end
      break if solution.length == 3
    end

    break if solution.length == 3

    # populate next sub results
    values.each_with_index do |val, i|
      sub_results[index][i] = value + val
    end
  end
  values << value
  index += 1
end

if solution.length == 3
  puts solution[0] * solution[1] * solution[2]
else
  puts "No result."
end