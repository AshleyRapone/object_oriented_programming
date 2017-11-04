# Given the class below, if we created a new instance of the class and then called to_s on
# that instance we would get something like "#<Cat:0x007ff39b356d30>"
# How could we go about changing the to_s output on this method to look like this: I am a tabby cat?
# (this is assuming that "tabby" is the type we passed in during initialization).

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

cat = Cat.new
puts cat

=begin
-When puts is called on an instance of a class the to_s method is automatically called
-When to_s is automatically called the class name and an encoding of the object id is returned
-We can override the to_s method so that we can customize what we want to return
-In the example I customized the to_s method so that it returned a string that references
the @type instance variable via the  type method
-To be able to reference the @type instance variable i used attr_reader :type
=end
