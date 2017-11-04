# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange = Fruit.new("apple")
hot_pizza.instane_variables
orange.instane_variables

=begin
-The Pizza class has an instance variable because instance variables are defined with a @ at the start of the name
-Can create an object of each class and pass in a string as an argument of the new method
-If the class contains an instance variable then the instance variable will be assigned to the name
-Can call the instance_variables method on each object and it will return an array of the instance variables in the class
-Can also see if you can retrieve the instance variable by making either a custom getter method or by using attr_accessor
or attr_reader and then calling the name method on the objects
=end
