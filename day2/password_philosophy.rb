count = 0

File.foreach("./input") do |line|
  password_line = line.split(" ")
  min,max = password_line[0].split("-").map(&:to_i)
  letter = password_line[1].tr(":", "")
  password = password_line[2]

  occurences = password.count(letter)
  if occurences >= min && occurences <= max
    count += 1
  end
end

if count > 0
  puts "Results found: #{count}"
else
  puts "No result."
end