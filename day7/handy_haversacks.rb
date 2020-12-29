# the solution is to build a graph of bags and then from the gold bag, search all adjancent nodes until there is no more nodes to visit

class DB
  def initialize
    _db = Hash.new
  end

  def find_or_create(bag)
    if _db[bag].nil?
      _db[bag] = Node.new
    end

    _db[bag]
  end
end

class Node
  attr_accessor :connections
  def initialize
    connections = Hash.new
  end

  def add_connection(bag)
    connection = db.find_or_create(bag)
    connections[bag] = connection
  end
end

File.foreach("./input") do |line|
  parent, connections = line.tr(".\n").split("contain")

end
