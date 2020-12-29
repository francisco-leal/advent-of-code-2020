groups = []
current_group = Hash.new

File.foreach("./input") do |line|
  if line == "\n"
    groups << current_group
    current_group = Hash.new
    next
  end

  line.tr("\n","").split("").each do |c|
    if current_group[c].nil?
      current_group[c] = 1
    else
      current_group[c] += 1
    end
  end
end

groups << current_group

puts "Total number of answers: #{groups.map(&:keys).map(&:length).sum}"
