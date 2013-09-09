class Apple
end

class Tree
  FLOWERS_GROW_COUNT = 10

  attr_accessor :apples, :flowers_count

  def initialize
    @apples = []
    @flowers_count = 0
  end

  def grow
    apples_grow_count = rand(0..@flowers_count)
    @flowers_count -= apples_grow_count
    @apples.push *apples_grow_count.times.map{ Apple.new }
  end

  def shake
    max_size = @apples.size
    @apples.shift(rand(0..max_size))
  end

  def blossom
    @flowers_count += rand(FLOWERS_GROW_COUNT)
  end
end

HELP_MESSAGE = 'Say grow, shake or blossom'

tree = Tree.new

puts HELP_MESSAGE
while(say = gets.strip) do
  if ['grow', 'shake', 'blossom'].include? say.strip
    tree.public_send say
    puts "Quantity of apples on tree: #{tree.apples.size}"
    puts "Quantity of flowers on tree: #{tree.flowers_count}"
  else
    puts HELP_MESSAGE
  end
end
