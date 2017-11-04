# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('brown', 'leather')

=begin
-When the new method is called on the class it creates a new instance of the class Bag
-Since instantiation of a new object automatically calls the initialize method we need
to make sure we pass in 2 arguments to the new class method because the arguments will be
passed to the local variables of the initialize method in which the initialize method
accepts 2 parameters
=end
