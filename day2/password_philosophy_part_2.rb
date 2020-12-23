count = 0

File.foreach("./input") do |line|
  password_line = line.split(" ")
  first_index,second_index = password_line[0].split("-").map(&:to_i)
  letter = password_line[1].tr(":", "")
  password = password_line[2]

  if (password[first_index-1] == letter) ^ (password[second_index-1] == letter)
    count += 1
  end
end

if count > 0
  puts "Results found: #{count}"
else
  puts "No result."
end