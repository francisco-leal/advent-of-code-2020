right_slope = 3
tree_count = 0
x = 0

File.foreach("./input") do |line|
  line = line.tr("\n", "")
  if line[x] == "#"
    tree_count += 1 
  end

  x += right_slope
  x -= line.length if x > (line.length - 1)
end

if tree_count > 0
  puts "Trees found: #{tree_count}"
else
  puts "No trees found."
end