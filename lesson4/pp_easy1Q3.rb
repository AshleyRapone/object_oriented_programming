# When we called the go_fast method from an instance of the Car class (as shown below)
# you might have noticed that the string printed when we go fast includes the name of
# the type of vehicle we are using. How is this done?

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

small_car = Car.new
small_car.go_fast

=begin
-The self keyword refers to the calling object
-The class method that is being called on the object returns the class of the object
-Dont need to use to_s method invocation because it is inside a string and is interpolated which means
the to_s method automatically gets called
=end
