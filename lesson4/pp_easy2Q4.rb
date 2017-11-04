# What could you add to this class to simplify it and remove two methods from the class
# definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

=begin
-You can add the attr_accessor :type method which creates the type getter method and setter methods
-We can also change the @type instance variable to type since we have a type getter method
=end
