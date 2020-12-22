values = []
match = nil
value = nil

File.foreach("./input") do |line|
  value = line.to_i
  if values.length > 1
    match = values.find do |val|
      val + value == 2020
    end
    break if match
  end
  values << value
end

if match
  puts match * value
else
  puts "No result."
end