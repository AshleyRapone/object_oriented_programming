# 1.
class Animal
  def inititalize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name  # => bark! bark! Teddy bark! bark!

=begin
We can reference the @name instance variable because even though the Dog class does not have
an inititalize method, its superclass Animal does have an inititalize method that takes one parameter and
inititalizes the @name instance variable
=end

# 2.
class Animal
  def inititalize(name)
    @name = name
  end
end

class Dog < Animal
  def inititalize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name  # => bark! bark! bark! bark!

=begin
The @name instance variable is nil becasue it was never inititalized. The Animal#inititalize
method was never executed because there was an inititalize method in the current class and
did not need to use the method lookup path
=end

# 3.
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim  # => nil

=begin
nil was returned because the @can_swim instance variable was never intiialized because
the swim method was called on the object teddy which is in the Dog class
=end

# 4.
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.enable_swimming
teddy.swim

=begin
Since the Swim#enable_swimming method was called the @can_swim instance variable was
inititalized and we can now access the @can_swim insstance variable when we can the swim
method on the object teddy
=end

# 5.
class Animal
  @@total_animals = 0

  def inititalize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals  # => 1

=begin
Once the class variable is inititalized within the class, there is no method needed
to explicitly invoke the class variable so when total_animals is called the method
returns the value of the class variable @@total_animals
=end

# 6.
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2
end

class Car < Vehicle
end

Motorcycle.wheels # => 2
Vehicle.wheels  # => 2
Car.wheels  # => 2

=begin
-The @@wheels class variable variable is inititalized in the Mortorcycle class and is
set to 2 and returns 2 when the weels method was called from the Vehicle class
-The @@wheels class variable returns 2 even though the @@wheels class variable is set
to 4 in the superclass
-The @@wheels class variable returns 2 even though the @@wheels class variable is set
in the Motorcycle class which is another subclass for Vehicle
=end

# 7.
class Dog
  LEGS = 4
end

class Cat
  def legs
    LEGS
  end
end

kitty = Cat.new
kitty.legs    # => NameError: uninitialized constant Cat::LEGS

=begin
There is an error because the constant LEGS is inititalized in the Dog class and Ruby
is looking for the LEGS constant within the Cat class
=end

class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS
  end
end

kitty = Cat.new
kitty.legs   # => 4

=begin
In order to use the constant LEGS which was inititalized in the Dog class inside the
Cat class you have to reference the class by using class::constant
=end

# 8.
class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels  # => 4

a_car = Car.new
a_car.wheels   # => 4

=begin
Since the WHEELS constant was inititalized in the superclass Vehicle the subclass
Car can reference the constant in the wheels instance and class methods
=end

# 9.
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires   # => NameError: uninitialized constant Maintenance::WHEELS

=begin
The change_tires method is called on the a_car object of the Car class that has
the Maintenance module mixed in.
Since the change_tires method is in the module Maintenance, Ruby will look for the WHEELS
constant in the Maintenance module
=end

module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tires."
  end
end

# or

module Maintenance
  def change_tires
    "Changing #{Car::WHEELS} tires."
  end
end

=begin
In order to access a constant that is not inititalized in the Maintenance module
we can either type Car::WHEELS to tell RUby to look for the WHEELS constant in the
Car class which can access the WHEELS constant through the Superclass Vehicle via inheritance

or we can access the constant by typing Vehicle::WHEELS since the constant is initialized
in the Vehicle class
=end
