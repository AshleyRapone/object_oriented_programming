# If we have a Car class and a Truck class and we want to be able to go_fast, how
# can we add the ability for them to go_fast using the module Speed? How can you
# check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new.go_fast
truck = Truck.new.go_fast

=begin
-You can use 'include Speed' in the Truck and the Car classes which would give us access
to the go_fast method

-You can check to see if the Car and Truck classes can use the go_fast method by
calling the go_fast method on the objects of Car and Truck classes
=end
