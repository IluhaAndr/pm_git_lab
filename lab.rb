class Apple
end

class Tree
  APPLES_GROW_COUNT = 10

  attr_accessor :apples

  def initialize
    @apples = []
  end

  def grow
    @apples.push *rand(APPLES_GROW_COUNT).times.map{ Apple.new }
  end

  def shake
    max_size = @apples.size
    @apples.shift(rand(max_size))
  end
end

tree = Tree.new

while(say = gets.strip) do
  if ['grow', 'shake'].include? say
    tree.public_send say
    puts "Quantity of apples on tree: #{tree.apples.size}"
  else
    puts "Say us grow or shake"
  end
end
