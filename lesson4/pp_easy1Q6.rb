# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

big_cube = Cube.new(5000)
big_cube.volume

=begin
We can create a volume getter method that returns the instance variable @volume so
that when we call the volume method on an object that is instantiated from the Cube class
the @volume instance variable is returned
-We can also use attr_accessor :volume that automatically creates a getter and setter method
=end
