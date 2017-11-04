# The Object Model

# 1.How do we create an object in Ruby? Give an example of the creation of an object.

class MyClass
end

my_obj = MyClass.new

=begin
An object is created by defining a class and then calling the new class method on
the class which creates an instance(object) of the class
=end

# 2. What is a module? What is its purpose? How do we use them with our classes?
#    Create a module for the class you created in exercise 1 and include it properly.

module Module
end

class MyClass
  include Module
end

my_obj = MyClass.new

=begin
-A module is used as a namespace where all of the classes that are similar can be kept
for later use or a container that holds methods
-A module is a collection of behaviors
-We use a module by mixing it in with the class by typing the include keyword followed
by the module name in our class
=end



# Classes and Objects - Part I

# 1. Create a class called MyCar. When you initialize a new instance or object of the class,
#    allow the user to define some instance variables that tell us the year, color, and model of the car.
#    Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
#    Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

# 2. Add an accessor method to your MyCar class to change and view the color of your car.
#    Then add an accessor method that allows you to view, but not modify, the year of your car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

lumina.color = 'black'
puts lumina.color
puts lumina.year

# 3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
#    Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

lumina.spray_paint('red')   #=> "Your new red paint job looks great!"



# Classes and Objects - Part II

# 1. Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"

# 2. Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.

# 3. When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# We get the following error...
=begin
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
=end

# Why do we get this error and how do we fix it?

=begin
-We get this error because we are trying to change the @name instance variable
but we do not have a name setter method.
We only have a getter method attr_reader :name so can only reference the @name instance variable

-We can fix this by changing attr_reader :name to attr_accessor :name
=end



# Inheritance

# 1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass.
#    Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#    Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

car = MyCar.new('2010', 'Ford Focus', 'silver')
truck = MyTruck.new('2010', 'Ford Tundra', 'white')
puts car
puts truck

# 2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass.
#    Create a method to print out the value of this class variable as well.

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.number_of_cars
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

car = MyCar.new('2010', 'Ford Focus', 'silver')
truck = MyTruck.new('2010', 'Ford Tundra', 'white')
puts Vehicle.number_of_vehicles

# 3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.number_of_cars
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

# 4. Print to the screen your method lookup for the classes that you have created.

puts Vehicle.ancestors
puts MyCar.ancestors
puts MyTruck.ancestors

# 5. Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class.
#    Make sure that all of your previous method calls are working when you are finished.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@number_of_vehicles = 0

  def self.number_of_cars
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

# 6. Write a method called age that calls a private method to calculate the age of the vehicle.
#    Make sure the private method is not available from outside of the class.
#    You'll need to use Ruby's built-in Time class to help.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@number_of_vehicles = 0

  def self.number_of_cars
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

puts lumina.age   #=> "Your chevy lumina is 17 years old"

# 7. Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error.
#    Create a better_grade_than? method, that you can call like so...

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
      grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)

# 8. Given the following code...

bob = Person.new
bob.hi

# And the corresponding error message...

=begin
NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
=end

# What is the problem and how would you go anout fixing it?

=begin
-hi is a private method and cannot be accessed outside of the class Person
-to fix this you can move the hi method above the private keyword in the class
=end
