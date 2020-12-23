slopes = [[1,1],[3,1],[5,1],[7,1],[1,2]]

results = slopes.map do |slope|
  tree_count = 0
  x = 0
  y = 0
  index = 0

  right_slope, vertical_slope = slope
  File.foreach("./input") do |line|
    if index != y
      index += 1
      next
    else
      y += vertical_slope
      index += 1
    end

    line = line.tr("\n", "")
    if line[x] == "#"
      tree_count += 1 
    end

    x += right_slope
    x -= line.length if x > (line.length - 1)
  end
  tree_count
end

puts results
puts "Trees found: #{results.reduce(1) { |elem, accum| elem * accum }}"
