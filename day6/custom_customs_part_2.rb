groups = []
current_group = Hash.new
current_group["number_of_people"] = 0

File.foreach("./input") do |line|
  if line == "\n"
    groups << current_group
    current_group = Hash.new
    current_group["number_of_people"] = 0
    next
  end

  current_group["number_of_people"] += 1

  line.tr("\n","").split("").each do |c|
    if current_group[c].nil?
      current_group[c] = 1
    else
      current_group[c] += 1
    end
  end
end

groups << current_group

total_answers = 0

groups.each do |group|
  group.each do |key, value|
    next if key == "number_of_people"

    total_answers += 1 if value == group["number_of_people"]
  end
end

puts "Total number of answers: #{total_answers}"
